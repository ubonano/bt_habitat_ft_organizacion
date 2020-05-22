import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_repository.dart';
import 'package:equatable/equatable.dart';

part 'workshop_event.dart';
part 'workshop_state.dart';

class WorkshopBloc extends Bloc<WorkshopEvent, WorkshopState> {
  final WorkshopRepository _workshopRepository = WorkshopRepository();
  StreamSubscription _workshopsSubscription;

  @override
  WorkshopState get initialState => WorkshopInitial();

  @override
  Stream<WorkshopState> mapEventToState(
    WorkshopEvent event,
  ) async* {
    if (event is ListWorkshopStarted) {
      yield* _mapListWorkshopStartedToState();
    } else if (event is ListWorkshopLoaded) {
      yield ListWorkshopSuccess(event.workshops);
    } else if (event is DeleteWorkshopStarted) {
      yield* _mapDeleteWorkshopStartedToState(event.workshopId);
    } else if (event is AddWorkshopStarted) {
      yield* _mapAddWorkshopStartedToState(event.workshop);
    }
  }

  Stream<WorkshopState> _mapListWorkshopStartedToState() async* {
    yield ListWorkshopInProcess();
    _workshopsSubscription?.cancel();
    _workshopRepository.all().listen(
          (workshops) => add(ListWorkshopLoaded(workshops)),
        );
  }

  Stream<WorkshopState> _mapDeleteWorkshopStartedToState(
      String workshopId) async* {
    try {
      yield DeleteWorkshopInProcess();
      await _workshopRepository.delete(workshopId);
      yield DeleteWorkshopSuccess();
    } catch (e) {
      yield DeleteWorkshopFailure();
    }
  }

  Stream<WorkshopState> _mapAddWorkshopStartedToState(
      Workshop workshop) async* {
    try {
      yield AddWorkshopInProcess();
      _workshopRepository.add(workshop);
      yield AddWorkshopSuccess();
    } catch (e) {
      yield AddWorkshopFailure();
    }
  }

  @override
  Future<void> close() {
    _workshopsSubscription?.cancel();
    return super.close();
  }
}
