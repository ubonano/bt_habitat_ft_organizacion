part of 'create_workshop_bloc.dart';

abstract class CreateWorkshopState extends Equatable {
  const CreateWorkshopState();
}

class CreateWorkshopInitial extends CreateWorkshopState {
  @override
  List<Object> get props => [];
}

class CreatingWorkshop extends CreateWorkshopState{
  
  @override
  List<Object> get props => [];
}

class WorkshopCreated extends CreateWorkshopState{
  
  @override
  List<Object> get props => [];
}