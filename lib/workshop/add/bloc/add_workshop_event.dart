part of 'add_workshop_bloc.dart';

abstract class AddWorkshopEvent extends Equatable {
  const AddWorkshopEvent();
}

class AddWorkshopStarted extends AddWorkshopEvent{

  final Workshop workshop;

  AddWorkshopStarted(this.workshop);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddWorkshopStarted {workshop: ${workshop.toString()}}';
}

