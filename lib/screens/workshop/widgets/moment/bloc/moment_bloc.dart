import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'moment_event.dart';
part 'moment_state.dart';

class MomentBloc extends Bloc<MomentEvent, MomentState> {
  @override
  MomentState get initialState => MomentInitial();

  @override
  Stream<MomentState> mapEventToState(
    MomentEvent event,
  ) async* {
  }
}
