import 'dart:async';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/models/component.dart';
import 'package:bt_habitat_ft_organizacion/repositories/component_repository.dart';
import 'package:equatable/equatable.dart';

part 'component_event.dart';
part 'component_state.dart';

class ComponentBloc extends Bloc<ComponentEvent, ComponentState> {
  final ComponentRepository _repository;
  StreamSubscription _subscription;

  ComponentBloc({@required ComponentRepository repository})
      : assert(repository != null),
        _repository = repository;

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
}
