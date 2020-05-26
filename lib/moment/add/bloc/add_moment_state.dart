part of 'add_moment_bloc.dart';

abstract class AddMomentState extends Equatable {
  const AddMomentState();
}

class AddMomentInitial extends AddMomentState {
  @override
  List<Object> get props => [];
}

class AddMomentInProcess extends AddMomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddMomentInProcess {}';
}

class AddMomentSuccess extends AddMomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddMomentSuccess {}';
}

class AddMomentFailure extends AddMomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddMomentFailure {}';
}
