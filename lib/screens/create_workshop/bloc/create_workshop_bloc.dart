import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshops_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'create_workshop_event.dart';
part 'create_workshop_state.dart';

class CreateWorkshopBloc
    extends Bloc<CreateWorkshopEvent, CreateWorkshopState> {

  final WorkshopsRepository _workshopsRepository;

  CreateWorkshopBloc({@required WorkshopsRepository workshopsRepository})
      : assert(workshopsRepository != null),
        _workshopsRepository = workshopsRepository;


  @override
  CreateWorkshopState get initialState => CreateWorkshopInitial();

  @override
  Stream<CreateWorkshopState> mapEventToState(
    CreateWorkshopEvent event,
  ) async* {
    if (event is CreateWorkshop) {
      yield* _mapCreateWorkshopToState(event.workshop);
    } else if (event is WorkshopWasCreated) {
      yield WorkshopCreated();
    }
  }

  Stream<CreateWorkshopState> _mapCreateWorkshopToState(Workshop workshop) async* {
    yield CreatingWorkshop();
    _workshopsRepository.addNewWorkshop(workshop)
    .then((value) => add(WorkshopWasCreated()));
  }
}
