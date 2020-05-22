part of 'component_bloc.dart';

abstract class ComponentState extends Equatable {
  const ComponentState();
}

class ComponentInitial extends ComponentState {
  @override
  List<Object> get props => [];
}

class ListComponentinProcess extends ComponentState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListComponentinProcess {}';
}

class ListComponentSuccess extends ComponentState{
  final List<Component> components;

  ListComponentSuccess({@required this.components});
  @override
  List<Object> get props => [this.components];

  @override
  String toString() => 'ListComponentSuccess {}';
}


class AddComponentInProcess extends ComponentState{
  
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddComponentInProcess {}';
}

class AddComponentSuccess extends ComponentState{
  
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddComponentSuccess {}';
}

class AddComponentFailure extends ComponentState{
  
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddComponentFailure {}';
}