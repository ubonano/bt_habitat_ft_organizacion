part of 'delete_component_bloc.dart';

abstract class DeleteComponentState extends Equatable {
  const DeleteComponentState();
}

class DeleteComponentInitial extends DeleteComponentState {
  @override
  List<Object> get props => [];
}

class DeleteComponentInProcess extends DeleteComponentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteComponentInProcess {}';
}

class DeleteComponentSuccess extends DeleteComponentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteComponentSuccess {}';
}

class DeleteComponentFailure extends DeleteComponentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteComponentFailure {}';
}
