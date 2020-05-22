part of 'moment_bloc.dart';

abstract class MomentEvent extends Equatable {
  const MomentEvent();
}

class ListMomentStarted extends MomentEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListMomentStarted {}';
}

class ListMomentLoaded extends MomentEvent {
  final List<Moment> moments;

  ListMomentLoaded(this.moments);

  @override
  List<Object> get props => [moments];

  @override
  String toString() => 'ListMomentLoaded { moments: $moments }';
}
