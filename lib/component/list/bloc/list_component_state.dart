part of 'list_component_bloc.dart';

abstract class ListComponentState extends Equatable {
  const ListComponentState();
}

class ListComponentInitial extends ListComponentState {
  @override
  List<Object> get props => [];
}

class ListComponentInProcess extends ListComponentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListComponentInProcess {}';
}

class ListComponentSuccess extends ListComponentState {
  final List<Component> components;

  ListComponentSuccess(this.components);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListComponentSuccess { components: $components }';
}
