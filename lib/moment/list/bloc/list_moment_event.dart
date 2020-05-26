part of 'list_moment_bloc.dart';

abstract class ListMomentEvent extends Equatable {
  const ListMomentEvent();
}

class ListMomentStarted extends ListMomentEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListMomentStarted {}';
}

class ListMomentLoaded extends ListMomentEvent {
  final List<Moment> moments;

  ListMomentLoaded(this.moments);

  @override
  List<Object> get props => [moments];

  @override
  String toString() => 'ListMomentLoaded { moments: $moments }';
}
