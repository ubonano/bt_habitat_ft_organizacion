import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

import 'package:bt_habitat_ft_organizacion/moment/moment_repository.dart';
import 'package:bt_habitat_ft_organizacion/moment/moment_model.dart';

part 'list_moment_event.dart';
part 'list_moment_state.dart';

class ListMomentBloc extends Bloc<ListMomentEvent, ListMomentState> {
  final String workshopId;
  final MomentRepository _momentsRepository;
  StreamSubscription _momentSubscription;

  ListMomentBloc(this.workshopId)
      : _momentsRepository = MomentRepository(workshopId);

  @override
  ListMomentState get initialState => ListMomentInitial();

  @override
  Stream<ListMomentState> mapEventToState(
    ListMomentEvent event,
  ) async* {
    if (event is ListMomentStarted) {
      yield* _mapListMomentStartedToState();
    } else if (event is ListMomentLoaded) {
      yield ListMomentSuccess(event.moments);
    }
  }

  Stream<ListMomentState> _mapListMomentStartedToState() async* {
    yield ListMomentInProcess();
    _momentSubscription?.cancel();
    _momentSubscription = _momentsRepository.all().listen(
          (moments) => add(ListMomentLoaded(moments)),
        );
  }

  @override
  Future<void> close() {
    _momentSubscription?.cancel();
    return super.close();
  }
}
