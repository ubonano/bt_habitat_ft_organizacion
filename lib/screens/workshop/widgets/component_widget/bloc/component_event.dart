part of 'component_bloc.dart';

abstract class ComponentEvent extends Equatable {
  const ComponentEvent();
}


class ListComponentStarted extends ComponentEvent{
  
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListComponentStarted {}';
}

class ListComponentLoaded extends ComponentEvent{
  final List<Component> components;

  ListComponentLoaded({this.components});

  @override
  List<Object> get props => throw UnimplementedError();

  @override
  String toString() => 'ListComponentLoaded { components: $components }';
}