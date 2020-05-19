import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/models/component_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/component_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'component_event.dart';
part 'component_state.dart';

class ComponentBloc extends Bloc<ComponentEvent, ComponentState> {

  final ComponentRepository _repository;
  StreamSubscription _subscription;

  ComponentBloc({@required ComponentRepository repository}):
    assert(repository != null),
    _repository = repository;

  @override
  ComponentState get initialState => ComponentInitial();

  @override
  Stream<ComponentState> mapEventToState(
    ComponentEvent event,
  ) async* {
    if (event is ListComponentStarted) {
      yield* _mapListComponentStartedToState();
    }else if(event is ListComponentLoaded){
      yield ListComponentSuccess(components: event.components);
    }
  }

  Stream<ComponentState> _mapListComponentStartedToState() async * {
    yield ListComponentinProcess();
    _subscription?.cancel();
    _subscription = _repository.all().listen(
          (components) => add(ListComponentLoaded(components: components)),
        );
  }
}
