part of 'workshop_bloc.dart';

abstract class WorkshopEvent extends Equatable {
  const WorkshopEvent();
}

class ListWorkshopStarted extends WorkshopEvent{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListWorkshopStarted {}';
}

class ListWorkshopLoaded extends WorkshopEvent{
  final List<Workshop> workshops;

  ListWorkshopLoaded(this.workshops);

  @override
  List<Object> get props => [workshops];

  @override
  String toString() => 'ListWorkshopLoaded {workshops: $workshops}';
}

class DeleteWorkshopStarted extends WorkshopEvent{

  final String workshopId;

  DeleteWorkshopStarted(this.workshopId);

  @override
  List<Object> get props => [workshopId];

  @override
  String toString() => 'DeleteWorkshopStarted {workshopId: $workshopId}';
}

class AddWorkshopStarted extends WorkshopEvent{

  final Workshop workshop;

  AddWorkshopStarted(this.workshop);

  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddWorkshopStarted {workshop: ${workshop.toString()}}';
}
