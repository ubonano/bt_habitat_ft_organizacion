import 'package:bt_habitat_ft_organizacion/repositories/workshop_repository.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'delete_workshop_event.dart';
part 'delete_workshop_state.dart';

class DeleteWorkshopBloc
    extends Bloc<DeleteWorkshopEvent, DeleteWorkshopState> {
  final WorkshopRepository _repository;

  DeleteWorkshopBloc({@required repository})
      : assert(repository != null),
        _repository = repository;



  @override
  DeleteWorkshopState get initialState => DeleteWorkshopInitial();

  @override
  Stream<DeleteWorkshopState> mapEventToState(
    DeleteWorkshopEvent event,
  ) async* {
    if (event is DeleteWorkshopStarted) {
      yield* _mapDeleteWorkshopStartedToState(event.workshopId);
    }
  }

  Stream<DeleteWorkshopState> _mapDeleteWorkshopStartedToState(
      String workshopId) async* {
    try {
      yield DeleteWorkshopInProcess();
      await _repository.delete(workshopId);
      yield DeleteWorkshopSuccess();
    } catch (e) {
      yield DeleteWorkshopFailure();
    }
  }
}
