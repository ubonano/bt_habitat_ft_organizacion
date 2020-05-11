part of 'workshops_bloc.dart';

abstract class WorkshopsState extends Equatable {
  const WorkshopsState();
}

class WorkshopsInitial extends WorkshopsState {
  @override
  List<Object> get props => [];
}

class WorkshopsLoadInProgress extends WorkshopsState {
  @override
  List<Object> get props => [];
}

class WorkshopsLoadSuccess extends WorkshopsState {
  final List<Workshop> workshops;

  WorkshopsLoadSuccess(this.workshops);

  @override
  List<Object> get props => [workshops];

  @override
  String toString() {
    return 'WorkshopsLoadSuccess {${this.workshops}}';
  }
}

class WorkshopsLoadFailure extends WorkshopsState {
  @override
  List<Object> get props => [];
}
