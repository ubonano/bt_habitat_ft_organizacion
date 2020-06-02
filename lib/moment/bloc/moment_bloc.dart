import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:bt_habitat_ft_organizacion/moment/moment_repository.dart';
import 'package:bt_habitat_ft_organizacion/moment/moment_model.dart';

part 'moment_event.dart';
part 'moment_state.dart';

class MomentBloc extends Bloc<MomentEvent, MomentState> {
  final String workshopId;
  final MomentRepository _momentsRepository;
  StreamSubscription _momentSubscription;

  MomentBloc(this.workshopId)
      : _momentsRepository = MomentRepository(workshopId);

  @override
  MomentState get initialState => MomentInitial();

  @override
  Stream<MomentState> mapEventToState(
    MomentEvent event,
  ) async* {
    if (event is ListMomentStarted) {
      yield* _mapListMomentStartedToState();
    } else if (event is ListMomentLoaded) {
      yield ListMomentSuccess(event.moments);
    } else if (event is AddMomentStarted) {
      yield* _mapAddMomentStartedToState(event.moment);
    } else if (event is DeleteMomentStarted) {
      yield* _mapDeleteMomentStartedToState(event.momentId);
    }
  }

  Stream<MomentState> _mapListMomentStartedToState() async* {
    yield ListMomentInProcess();
    _momentSubscription?.cancel();
    _momentSubscription = _momentsRepository.all().listen(
          (moments) => add(ListMomentLoaded(moments)),
        );
  }

  Stream<MomentState> _mapAddMomentStartedToState(Moment moment) async* {
    try {
      yield AddMomentInProcess();
      _momentsRepository.add(moment);
      yield AddMomentSuccess();
    } catch (_) {
      yield AddMomentFailure();
    }
  }

  Stream<MomentState> _mapDeleteMomentStartedToState(String momentId) async* {
    try {
      yield DeleteMomentInProcess();
      _momentsRepository.delete(momentId);
      yield DeleteMomentSuccess();
    } catch (_) {
      yield DeleteMomentFailure();
    }
  }

  @override
  Future<void> close() {
    _momentSubscription?.cancel();
    return super.close();
  }
}
