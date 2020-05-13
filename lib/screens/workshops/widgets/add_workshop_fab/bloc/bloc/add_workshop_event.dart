part of 'add_workshop_bloc.dart';

abstract class AddWorkshopEvent extends Equatable {
  const AddWorkshopEvent();
}

class AddWorkshopStarted extends AddWorkshopEvent {

  final Workshop workshop;

  AddWorkshopStarted(this.workshop);

  @override
  List<Object> get props => [this.workshop];

  @override
  String toString() => "{Event: AddWorkshopStarte - Workshop:${this.workshop}}";
}

class AddWorkshopFinished extends AddWorkshopEvent {

  final bool wasAdded;
  final String message;

  AddWorkshopFinished(this.wasAdded, this.message);

  @override
  List<Object> get props => [this.wasAdded, this.message];

  @override
  String toString() => "{Event: AddWorkshopFinished - WasAdded:${this.wasAdded}, Message: ${this.message}}";
}
