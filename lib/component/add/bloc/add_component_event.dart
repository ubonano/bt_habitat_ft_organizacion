part of 'add_component_bloc.dart';

abstract class AddComponentEvent extends Equatable {
  const AddComponentEvent();
}

class AddComponentStarted extends AddComponentEvent{

  final Component component;

  AddComponentStarted(this.component);
  
  @override
  List<Object> get props => [this.component];

  @override
  String toString() => 'AddComponentStarted {component: ${this.component}}';
}
