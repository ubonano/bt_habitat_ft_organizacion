part of 'add_component_bloc.dart';

abstract class AddComponentState extends Equatable {
  const AddComponentState();
}

class AddComponentInitial extends AddComponentState {
  @override
  List<Object> get props => [];
}

class AddComponentInProcess extends AddComponentState{
  
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddComponentInProcess {}';
}

class AddComponentSuccess extends AddComponentState{
  
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddComponentSuccess {}';
}

class AddComponentFailure extends AddComponentState{
  
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddComponentFailure {}';
}
