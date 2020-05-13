part of 'add_workshop_bloc.dart';

abstract class AddWorkshopState extends Equatable {
  const AddWorkshopState();
}

class AddWorkshopInitial extends AddWorkshopState {
  @override
  List<Object> get props => [];
}

class AddWorkshopInProgress extends AddWorkshopState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'State: AddWorkshopInProgress';
}

class AddWorkshopSuccess extends AddWorkshopState {
  
  final String message;

  AddWorkshopSuccess(this.message);

  @override
  List<Object> get props => [this.message];
  
  @override
  String toString() => 'State: AddWorkshopSucces - Message: ${this.message}';
}

class AddWorkshopFailure extends AddWorkshopState {

  final String message;

  AddWorkshopFailure(this.message);

  @override
  List<Object> get props => [this.message];

  @override
  String toString() => 'State: AddWorkshopFailure - Message: ${this.message}';
}
