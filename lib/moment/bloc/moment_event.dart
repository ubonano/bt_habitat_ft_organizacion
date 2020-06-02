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

class DeleteMomentStarted extends MomentEvent {
  final String momentId;

  DeleteMomentStarted(this.momentId);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteMomentStarted { momentId: $momentId }';
}

class AddMomentStarted extends MomentEvent {
  final Moment moment;

  AddMomentStarted(this.moment);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddMomentStarted { moment: $moment }';
}
