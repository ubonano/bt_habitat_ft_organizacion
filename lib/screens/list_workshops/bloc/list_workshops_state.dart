

part of 'list_workshops_bloc.dart';

abstract class ListWorkshopsState extends Equatable {
  const ListWorkshopsState();
}

class ListWorkshopsInitial extends ListWorkshopsState {
  @override
  List<Object> get props => [];
}

class WorkshopsLoadInProgress extends ListWorkshopsState {
  @override
  List<Object> get props => [];
}

class WorkshopsLoadSuccess extends ListWorkshopsState {
  final List<Workshop> workshops;

  WorkshopsLoadSuccess(this.workshops);

  @override
  List<Object> get props => [workshops];

  @override
  String toString() {
    return 'WorkshopsLoadSuccess {${this.workshops}}';
  }
}

class WorkshopsLoadFailure extends ListWorkshopsState {
  @override
  List<Object> get props => [];
}
