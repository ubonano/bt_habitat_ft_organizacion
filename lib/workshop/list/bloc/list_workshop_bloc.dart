import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_repository.dart';
import 'package:equatable/equatable.dart';

part 'list_workshop_event.dart';
part 'list_workshop_state.dart';

class ListWorkshopBloc extends Bloc<ListWorkshopEvent, ListWorkshopState> {
  final WorkshopRepository _workshopRepository = WorkshopRepository();
  StreamSubscription _workshopSubscription;

  @override
  ListWorkshopState get initialState => ListWorkshopInitial();

  @override
  Stream<ListWorkshopState> mapEventToState(
    ListWorkshopEvent event,
  ) async* {
    if (event is ListWorkshopStarted) {
      yield* _mapListWorkshopStartedToState();
    } else if (event is ListWorkshopLoaded) {
      yield ListWorkshopSuccess(event.workshops);
    } 
  }

  Stream<ListWorkshopState> _mapListWorkshopStartedToState() async* {
    yield ListWorkshopInProcess();
    _workshopSubscription?.cancel();
    _workshopRepository.all().listen(
          (workshops) => add(ListWorkshopLoaded(workshops)),
        );
  }



  @override
  Future<void> close() {
    _workshopSubscription?.cancel();
    return super.close();
  }
}
