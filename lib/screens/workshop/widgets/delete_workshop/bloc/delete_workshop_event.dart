part of 'delete_workshop_bloc.dart';

abstract class DeleteWorkshopEvent extends Equatable {
  const DeleteWorkshopEvent();
}

class DeleteWorkshopStarted extends DeleteWorkshopEvent{

  final String workshopId;

  DeleteWorkshopStarted({@required this.workshopId});
  
  @override
  List<Object> get props => [this.workshopId];
}