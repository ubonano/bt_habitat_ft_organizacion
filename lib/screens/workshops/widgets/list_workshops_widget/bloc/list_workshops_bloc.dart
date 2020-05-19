import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshop_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'list_workshops_event.dart';
part 'list_workshops_state.dart';

class ListWorkshopsBloc extends Bloc<ListWorkshopsEvent, ListWorkshopsState> {
  final WorkshopRepository _workshopRepository;
  StreamSubscription _workshopsSubscription;

  ListWorkshopsBloc({@required WorkshopRepository workshopRepository})
      : assert(workshopRepository != null),
        _workshopRepository = workshopRepository;

  void init() => this.add(ListWorkshopsStarted());

  @override
  ListWorkshopsState get initialState => ListWorkshopsInitial();

  @override
  Stream<ListWorkshopsState> mapEventToState(
    ListWorkshopsEvent event,
  ) async* {
    if (event is ListWorkshopsStarted) {
      yield* _mapWorkshopsLoadStartedToState();
    } else if (event is ListWorkshopsLoaded) {
      yield ListWorkshopsSuccess(event.workshops);
    }
  }

  Stream<ListWorkshopsState> _mapWorkshopsLoadStartedToState() async* {
    yield ListWorkshopsInProcess();
    _workshopsSubscription?.cancel();
    _workshopsSubscription = _workshopRepository.all().listen(
          (workshops) => add(ListWorkshopsLoaded(workshops)),
        );
  }

  @override
  Future<void> close() {
    _workshopsSubscription?.cancel();
    return super.close();
  }
}
