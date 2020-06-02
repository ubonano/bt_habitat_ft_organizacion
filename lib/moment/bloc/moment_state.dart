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

class AddMomentInProcess extends MomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddMomentInProcess {}';
}

class AddMomentSuccess extends MomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddMomentSuccess {}';
}

class AddMomentFailure extends MomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddMomentFailure {}';
}

class DeleteMomentInProcess extends MomentState {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'DeleteMomentInProcess {}';
}

class DeleteMomentSuccess extends MomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteMomentSuccess {}';
}

class DeleteMomentFailure extends MomentState {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'DeleteMomentFailure {}';
}
