part of 'delete_moment_bloc.dart';

abstract class DeleteMomentState extends Equatable {
  const DeleteMomentState();
}

class DeleteMomentInitial extends DeleteMomentState {
  @override
  List<Object> get props => [];
}

class DeleteMomentInProcess extends DeleteMomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteMomentInProcess {}';
}

class DeleteMomentSuccess extends DeleteMomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteMomentSuccess {}';
}

class DeleteMomentFailure extends DeleteMomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteMomentFailure {}';
}
