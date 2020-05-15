part of 'create_workshop_bloc.dart';

abstract class CreateWorkshopEvent extends Equatable {
  const CreateWorkshopEvent();
}

class CreateWorkshop extends CreateWorkshopEvent{
  final Workshop workshop;

  CreateWorkshop(this.workshop);
  
  @override
  List<Object> get props => [workshop];
}

class WorkshopWasCreated extends CreateWorkshopEvent{
  
  @override
  List<Object> get props => [];
}
