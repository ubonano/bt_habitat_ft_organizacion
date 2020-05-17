

part of 'list_workshops_bloc.dart';

abstract class ListWorkshopsState extends Equatable {
  const ListWorkshopsState();
}

class ListWorkshopsInitial extends ListWorkshopsState {
  @override
  List<Object> get props => [];
}

class ListWorkshopsInProcess extends ListWorkshopsState {
  @override
  List<Object> get props => [];
}

class ListWorkshopsSuccess extends ListWorkshopsState {
  final List<Workshop> workshops;

  ListWorkshopsSuccess(this.workshops);

  @override
  List<Object> get props => [workshops];
}

class ListWorkshopsFailure extends ListWorkshopsState {
  @override
  List<Object> get props => [];
}
