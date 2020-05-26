part of 'delete_workshop_bloc.dart';

abstract class DeleteWorkshopState extends Equatable {
  const DeleteWorkshopState();
}

class DeleteWorkshopInitial extends DeleteWorkshopState {
  @override
  List<Object> get props => [];
}

class DeleteWorkshopInProcess extends DeleteWorkshopState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteWorkshopInProcess {}';
}

class DeleteWorkshopSuccess extends DeleteWorkshopState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteWorkshopSuccess {}';
}

class DeleteWorkshopFailure extends DeleteWorkshopState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteWorkshopFailure {}';
}
