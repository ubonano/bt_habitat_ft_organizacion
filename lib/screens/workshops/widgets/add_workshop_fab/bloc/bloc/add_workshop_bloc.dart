import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_workshop_event.dart';
part 'add_workshop_state.dart';

class AddWorkshopBloc extends Bloc<AddWorkshopEvent, AddWorkshopState> {
  @override
  AddWorkshopState get initialState => AddWorkshopInitial();

  @override
  Stream<AddWorkshopState> mapEventToState(
    AddWorkshopEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
