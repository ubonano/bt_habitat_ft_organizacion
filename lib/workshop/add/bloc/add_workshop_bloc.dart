import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_repository.dart';
import 'package:equatable/equatable.dart';

part 'add_workshop_event.dart';
part 'add_workshop_state.dart';

class AddWorkshopBloc extends Bloc<AddWorkshopEvent, AddWorkshopState> {
  final WorkshopRepository _workshopRepository = WorkshopRepository();

  @override
  AddWorkshopState get initialState => AddWorkshopInitial();

  @override
  Stream<AddWorkshopState> mapEventToState(
    AddWorkshopEvent event,
  ) async* {
    if (event is AddWorkshopStarted) {
      yield* _mapAddWorkshopStartedToState(event.workshop);
    }
  }

  Stream<AddWorkshopState> _mapAddWorkshopStartedToState(
      Workshop workshop) async* {
    try {
      yield AddWorkshopInProcess();
      _workshopRepository.add(workshop);
      yield AddWorkshopSuccess();
    } catch (e) {
      yield AddWorkshopFailure();
    }
  }
}
