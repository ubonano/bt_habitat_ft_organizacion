import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshops_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_workshop_event.dart';
part 'add_workshop_state.dart';

class AddWorkshopBloc
    extends Bloc<AddWorkshopEvent, AddWorkshopState> {

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
      yield* _mapAddWorkshopToState(event.workshop);
    } 
  }

  Stream<AddWorkshopState> _mapAddWorkshopToState(Workshop workshop) async* {
    yield AddWorkshopInProcess();

    try{
      await _workshopsRepository.addNewWorkshop(workshop);
      yield AddWorkshopSuccess();
    }catch(e){
      yield AddWorkshopFailure();
    }    
  }
}
