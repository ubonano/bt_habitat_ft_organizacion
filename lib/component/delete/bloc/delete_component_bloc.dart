import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/component/component_repository.dart';
import 'package:equatable/equatable.dart';

part 'delete_component_event.dart';
part 'delete_component_state.dart';

class DeleteComponentBloc
    extends Bloc<DeleteComponentEvent, DeleteComponentState> {
  final ComponentRepository _componentRepository;

  DeleteComponentBloc(String workshopId, String momentId)
      : _componentRepository = ComponentRepository(workshopId, momentId);

  @override
  DeleteComponentState get initialState => DeleteComponentInitial();

  @override
  Stream<DeleteComponentState> mapEventToState(
    DeleteComponentEvent event,
  ) async* {
    if (event is DeleteComponentStarted) {
      yield* _mapDeleteComponentStartedToState(event.componentId);
    }
  }

  Stream<DeleteComponentState> _mapDeleteComponentStartedToState(
      String componentId) async* {
    try {
      yield DeleteComponentInProcess();
      _componentRepository.delete(componentId);
      yield DeleteComponentSuccess();
    } catch (e) {
      yield DeleteComponentFailure();
    }
  }
}
