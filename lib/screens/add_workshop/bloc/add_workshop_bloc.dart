import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshop_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'add_workshop_event.dart';
part 'add_workshop_state.dart';

class AddWorkshopBloc
    extends Bloc<AddWorkshopEvent, AddWorkshopState> {

  final WorkshopRepository _workshopRepository;

  AddWorkshopBloc({@required WorkshopRepository workshopRepository})
      : assert(workshopRepository != null),
        _workshopRepository = workshopRepository;


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
      await _workshopRepository.add(workshop);
      yield AddWorkshopSuccess();
    }catch(e){
      yield AddWorkshopFailure();
    }    
  }
}
