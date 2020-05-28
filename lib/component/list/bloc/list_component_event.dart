part of 'list_component_bloc.dart';

abstract class ListComponentEvent extends Equatable {
  const ListComponentEvent();
}

class ListComponentStarted extends ListComponentEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListComponentStarted {}';
}

class ListComponentLoaded extends ListComponentEvent {
  final List<Component> components;

  ListComponentLoaded(this.components);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListComponentLoaded { components: $components }';
}
