import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/component/component_repository.dart';
import 'package:bt_habitat_ft_organizacion/component/model/component.dart';
import 'package:equatable/equatable.dart';

part 'list_component_event.dart';
part 'list_component_state.dart';

class ListComponentBloc extends Bloc<ListComponentEvent, ListComponentState> {
  final String workshopId;
  final String momentId;

  final ComponentRepository _repository;
  StreamSubscription _subscription;

  ListComponentBloc(this.workshopId, this.momentId)
      : _repository = ComponentRepository(workshopId, momentId);

  @override
  ListComponentState get initialState => ListComponentInitial();

  @override
  Stream<ListComponentState> mapEventToState(
    ListComponentEvent event,
  ) async* {
    if (event is ListComponentStarted) {
      yield* _mapListComponentStartedToState();
    } else if (event is ListComponentLoaded) {
      yield ListComponentSuccess(event.components);
    }
  }

  Stream<ListComponentState> _mapListComponentStartedToState() async* {
    yield ListComponentInProcess();
    _subscription?.cancel();
    _subscription = _repository.all().listen(
          (components) => add(ListComponentLoaded(components)),
        );
  }
}
