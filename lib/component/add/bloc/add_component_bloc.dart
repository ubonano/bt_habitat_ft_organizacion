import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/component/component_repository.dart';
import 'package:bt_habitat_ft_organizacion/component/model/component.dart';
import 'package:equatable/equatable.dart';

part 'add_component_event.dart';
part 'add_component_state.dart';

class AddComponentBloc extends Bloc<AddComponentEvent, AddComponentState> {
  final String workshopId;
  final String momentId;

  final ComponentRepository _repository;

  AddComponentBloc(this.workshopId, this.momentId)
      : _repository = ComponentRepository(workshopId, momentId);
  @override
  AddComponentState get initialState => AddComponentInitial();

  @override
  Stream<AddComponentState> mapEventToState(
    AddComponentEvent event,
  ) async* {
    if (event is AddComponentStarted) {
      yield* _mapAddComponentStartedToState(event.component);
    }
  }

  Stream<AddComponentState> _mapAddComponentStartedToState(
      Component component) async* {
    try {
      yield AddComponentInProcess();
      await _repository.add(component);
      yield AddComponentSuccess();
    } catch (e) {
      yield AddComponentFailure();
    }
  }
}
