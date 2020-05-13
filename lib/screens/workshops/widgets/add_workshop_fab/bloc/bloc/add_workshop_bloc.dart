import 'dart:async';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshops_repository.dart';

part 'add_workshop_event.dart';
part 'add_workshop_state.dart';

class AddWorkshopBloc extends Bloc<AddWorkshopEvent, AddWorkshopState> {
  final WorkshopsRepository _workshopsRepository;

  AddWorkshopBloc({@required WorkshopsRepository workshopsRepository})
      : assert(workshopsRepository != null),
        _workshopsRepository = workshopsRepository;

  @override
  AddWorkshopState get initialState => AddWorkshopInitial();

  @override
  Stream<AddWorkshopState> mapEventToState(
    AddWorkshopEvent event,
  ) async* {
    if (event is AddWorkshopStarted) {
      yield* _mapAddWorkshopStartedToState(event);
    } else if (event is AddWorkshopFinished) {
      yield* _mapAddWorkshopFinishedToState(event);
    }
  }

  Stream<AddWorkshopState> _mapAddWorkshopStartedToState(AddWorkshopStarted event) async* {
    yield AddWorkshopInProgress();
    _workshopsRepository
        .addNewWorkshop(event.workshop)
        .then((value) => add(AddWorkshopFinished(true, "¡Taller creado con exito!")))
        .catchError((error) => add(AddWorkshopFinished(false, "Ocurrio un problema, intente mas tarde")));
  }

  Stream<AddWorkshopState> _mapAddWorkshopFinishedToState(AddWorkshopFinished event) async* {
    if(event.wasAdded){
      yield AddWorkshopSuccess(event.message);
    } else {
      yield AddWorkshopFailure(event.message);
    }
  }
}