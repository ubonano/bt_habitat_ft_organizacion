part of 'delete_component_bloc.dart';

abstract class DeleteComponentEvent extends Equatable {
  const DeleteComponentEvent();
}

class DeleteComponentStarted extends DeleteComponentEvent {

  final String componentId;

  DeleteComponentStarted(this.componentId);

  @override
  List<Object> get props => [componentId];

  @override
  String toString() => 'DeleteComponentStarted { componentId: $componentId }';
}
