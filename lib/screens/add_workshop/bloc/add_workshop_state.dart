part of 'add_workshop_bloc.dart';


abstract class AddWorkshopState extends Equatable {
  const AddWorkshopState();
}

class AddWorkshopInitial extends AddWorkshopState {
  @override
  List<Object> get props => [];
}

class AddWorkshopInProcess extends AddWorkshopState{
  
  @override
  List<Object> get props => [];
}

class AddWorkshopSuccess extends AddWorkshopState{
  
  @override
  List<Object> get props => [];
}

class AddWorkshopFailure extends AddWorkshopState{
  
  @override
  List<Object> get props => [];
}