import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshops_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'workshops_event.dart';
part 'workshops_state.dart';

class WorkshopsBloc extends Bloc<WorkshopsEvent, WorkshopsState> {
  final WorkshopsRepository _workshopsRepository;
  StreamSubscription _workshopsSubscription;

  WorkshopsBloc({@required WorkshopsRepository workshopsRepository})
      : assert(workshopsRepository != null),
        _workshopsRepository = workshopsRepository;

  void init() {
    this.add(WorkshopsLoadStarted());
  }

  @override
  WorkshopsState get initialState => WorkshopsInitial();

  @override
  Stream<WorkshopsState> mapEventToState(
    WorkshopsEvent event,
  ) async* {
    if (event is WorkshopsLoadStarted) {
      yield* _mapWorkshopsLoadStartedToState();
    } else if (event is WorkshopsLoadLoaded) {
      yield WorkshopsLoadSuccess(event.workshops);
    } 
  }

  Stream<WorkshopsState> _mapWorkshopsLoadStartedToState() async* {
    yield WorkshopsLoadInProgress();
    _workshopsSubscription?.cancel();
    _workshopsSubscription = _workshopsRepository.workshops().listen(
          (workshops) => add(WorkshopsLoadLoaded(workshops)),
        );
  }

  @override
  Future<void> close() {
    _workshopsSubscription?.cancel();
    return super.close();
  }
}
