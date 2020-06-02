part of 'component_bloc.dart';

abstract class ComponentEvent extends Equatable {
  const ComponentEvent();
}

class ListComponentStarted extends ComponentEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListComponentStarted {}';
}

class ListComponentLoaded extends ComponentEvent {
  final List<Component> components;

  ListComponentLoaded({this.components});

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListComponentLoaded { components: $components }';
}

class AddComponentStarted extends ComponentEvent {
  final Component component;

  AddComponentStarted(this.component);

  @override
  List<Object> get props => [this.component];

  @override
  String toString() => 'AddComponentStarted {component: ${this.component}}';
}

class DeleteComponentStarted extends ComponentEvent {
  final String componentId;

  DeleteComponentStarted(this.componentId);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteComponentStarted { componentId: $componentId }';
}
