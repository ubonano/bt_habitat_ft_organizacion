part of 'list_workshops_bloc.dart';

abstract class ListWorkshopsEvent extends Equatable {
  const ListWorkshopsEvent();
}


class ListWorkshopsStarted extends ListWorkshopsEvent {

  @override
  List<Object> get props => [];
}

class ListWorkshopsLoaded extends ListWorkshopsEvent {
  final List<Workshop> workshops;

  ListWorkshopsLoaded(this.workshops);

  @override
  List<Object> get props => [workshops];
}

