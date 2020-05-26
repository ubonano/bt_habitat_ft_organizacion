import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/moment/moment_model.dart';
import 'package:bt_habitat_ft_organizacion/moment/moment_repository.dart';
import 'package:equatable/equatable.dart';

part 'add_moment_event.dart';
part 'add_moment_state.dart';

class AddMomentBloc extends Bloc<AddMomentEvent, AddMomentState> {
  final MomentRepository _momentRepository;

  AddMomentBloc(String workshopId)
      : _momentRepository = MomentRepository(workshopId);

  @override
  AddMomentState get initialState => AddMomentInitial();

  @override
  Stream<AddMomentState> mapEventToState(
    AddMomentEvent event,
  ) async* {
    if (event is AddMomentStarted) {
      yield* _mapAddMomentStartedToState(event.moment);
    }
  }

  Stream<AddMomentState> _mapAddMomentStartedToState(Moment moment) async* {
    try {
      yield AddMomentInProcess();
      _momentRepository.add(moment);
      yield AddMomentSuccess();
    } catch (e) {
      yield AddMomentFailure();
    }
  }
}
