part of 'workshop_bloc.dart';


abstract class WorkshopState extends Equatable {
  const WorkshopState();
}

class WorkshopInitial extends WorkshopState {
  
  @override
  List<Object> get props => [];
}

class ListWorkshopInProcess extends WorkshopState{
  
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListWorkshopInProcess {}';
}

class ListWorkshopSuccess extends WorkshopState{

  final List<Workshop> workshops;

  ListWorkshopSuccess(this.workshops);
  
  @override
  List<Object> get props => [workshops];

  @override
  String toString() => 'ListWorkshopSuccess { workshops: $workshops}';
}

class ListWorkshopFailure extends WorkshopState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListWorkshopFailure {}';
}

class DeleteWorkshopInProcess extends WorkshopState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteWorkshopInProcess {}';
}

class DeleteWorkshopSuccess extends WorkshopState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteWorkshopSuccess {}';
}

class DeleteWorkshopFailure extends WorkshopState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'DeleteWorkshopFailure {}';
}


class AddWorkshopInProcess extends WorkshopState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddWorkshopInProcess {}';
}

class AddWorkshopSuccess extends WorkshopState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddWorkshopSuccess {}';
}

class AddWorkshopFailure extends WorkshopState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'AddWorkshopFailure {}';
}


