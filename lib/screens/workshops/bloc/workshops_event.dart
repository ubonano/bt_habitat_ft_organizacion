part of 'workshops_bloc.dart';

abstract class WorkshopsEvent extends Equatable {
  const WorkshopsEvent();
}


class WorkshopsLoadStarted extends WorkshopsEvent {

  @override
  List<Object> get props => [];

}

class WorkshopsLoadLoaded extends WorkshopsEvent {
  final List workshops;

  WorkshopsLoadLoaded(this.workshops);

  @override
  List<Object> get props => [this.workshops];

}