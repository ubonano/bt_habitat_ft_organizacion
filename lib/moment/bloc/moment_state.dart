part of 'moment_bloc.dart';

abstract class MomentState extends Equatable {
  const MomentState();
}

class MomentInitial extends MomentState {
  @override
  List<Object> get props => [];
}

class ListMomentInProcess extends MomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListMomentInProcess {}';
}

class ListMomentSuccess extends MomentState {
  final List<Moment> moments;

  ListMomentSuccess(this.moments);

  @override
  List<Object> get props => [moments];

  @override
  String toString() => 'ListMomentSuccess { moments: $moments}';
}
