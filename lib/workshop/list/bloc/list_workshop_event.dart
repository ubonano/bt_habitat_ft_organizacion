part of 'list_workshop_bloc.dart';

abstract class ListWorkshopEvent extends Equatable {
  const ListWorkshopEvent();
}

class ListWorkshopStarted extends ListWorkshopEvent{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListWorkshopStarted {}';
}

class ListWorkshopLoaded extends ListWorkshopEvent{
  final List<Workshop> workshops;

  ListWorkshopLoaded(this.workshops);

  @override
  List<Object> get props => [workshops];

  @override
  String toString() => 'ListWorkshopLoaded {workshops: $workshops}';
}