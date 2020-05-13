import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bt_habitat_ft_organizacion/models/moment_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/moments_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'moments_event.dart';
part 'moments_state.dart';

class MomentsBloc extends Bloc<MomentsEvent, MomentsState> {

  final MomentsRepository _momentsRepository;
  StreamSubscription _momentsSubscription;

    MomentsBloc({@required MomentsRepository momentsRepository})
      : assert(momentsRepository != null),
        _momentsRepository = momentsRepository;

  @override
  MomentsState get initialState => MomentsInitial();

  void init() => this.add(MomentsLoadStarted());

  @override
  Stream<MomentsState> mapEventToState(MomentsEvent event) async* {
    if(event is MomentsLoadStarted){
      yield* _mapMomentssLoadStartedToState();
    } else if (event is MomentsLoadLoaded){
      yield MomentsLoadSuccess(event.moments);
    }
  }

  Stream<MomentsState> _mapMomentssLoadStartedToState() async* {
    yield MomentsLoadInProgress();
    _momentsSubscription?.cancel();
    _momentsSubscription = _momentsRepository.moments().listen(
          (workshops) => add(MomentsLoadLoaded(workshops)),
        );
  }
}
