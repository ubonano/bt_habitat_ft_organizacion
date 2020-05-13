import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'workshop_event.dart';
part 'workshop_state.dart';

class WorkshopBloc extends Bloc<WorkshopEvent, WorkshopState> {
  @override
  WorkshopState get initialState => WorkshopInitial();

  @override
  Stream<WorkshopState> mapEventToState(
    WorkshopEvent event,
  ) async* {
    
  }
}
