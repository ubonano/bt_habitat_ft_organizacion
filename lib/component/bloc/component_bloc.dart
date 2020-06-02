import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/component/component_repository.dart';
import 'package:bt_habitat_ft_organizacion/component/model/component.dart';

part 'component_event.dart';
part 'component_state.dart';

class ComponentBloc extends Bloc<ComponentEvent, ComponentState> {
  final String workshopId;
  final String momentId;

  final ComponentRepository _repository;
  StreamSubscription _subscription;

  ComponentBloc(this.workshopId, this.momentId)
      : _repository = ComponentRepository(workshopId, momentId);

  @override
  ComponentState get initialState => ComponentInitial();

  @override
  Stream<ComponentState> mapEventToState(
    ComponentEvent event,
  ) async* {
    if (event is ListComponentStarted) {
      yield* _mapListComponentStartedToState();
    } else if (event is ListComponentLoaded) {
      yield ListComponentSuccess(components: event.components);
    } else if (event is AddComponentStarted) {
      yield* _mapAddComponentStartedToState(event.component);
    } else if (event is DeleteComponentStarted) {
      yield* _mapDeleteComponentStartedToState(event.componentId);
    }
  }

  Stream<ComponentState> _mapListComponentStartedToState() async* {
    yield ListComponentinProcess();
    _subscription?.cancel();
    _subscription = _repository.all().listen(
          (components) => add(ListComponentLoaded(components: components)),
        );
  }

  Stream<ComponentState> _mapAddComponentStartedToState(
      Component component) async* {
    try {
      yield AddComponentInProcess();
      await _repository.add(component);
      yield AddComponentSuccess();
    } catch (e) {
      yield AddComponentFailure();
    }
  }

  Stream<ComponentState> _mapDeleteComponentStartedToState(
      String componentId) async* {
    try {
      yield DeleteComponentInProcess();
      _repository.delete(componentId);
      yield DeleteComponentSuccess();
    } catch (_) {
      yield DeleteComponentFailure();
    }
  }
}
