part of 'workshop_bloc.dart';

abstract class WorkshopState extends Equatable {
  const WorkshopState();
}

class WorkshopInitial extends WorkshopState {
  @override
  List<Object> get props => [];
}
