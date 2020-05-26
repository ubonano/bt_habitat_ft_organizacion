import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/moment/moment_repository.dart';
import 'package:equatable/equatable.dart';

part 'delete_moment_event.dart';
part 'delete_moment_state.dart';

class DeleteMomentBloc extends Bloc<DeleteMomentEvent, DeleteMomentState> {
  MomentRepository _momentRepository;

  DeleteMomentBloc(String workshopDocumentId)
      : _momentRepository = MomentRepository(workshopDocumentId);

  @override
  DeleteMomentState get initialState => DeleteMomentInitial();

  @override
  Stream<DeleteMomentState> mapEventToState(
    DeleteMomentEvent event,
  ) async* {
    if (event is DeleteMomentStarted) {

      yield* _mapDeleteMomentStartedToState(event.momentId);
    }
  }

  Stream<DeleteMomentState> _mapDeleteMomentStartedToState(
      String momentId) async* {
    try {
      yield DeleteMomentInProcess();
      _momentRepository.delete(momentId);
      yield DeleteMomentSuccess();
    } catch (e) {
      yield DeleteMomentFailure();
    }
  }
}
