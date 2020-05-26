part of 'list_workshop_bloc.dart';


abstract class ListWorkshopState extends Equatable {
  const ListWorkshopState();
}

class ListWorkshopInitial extends ListWorkshopState {
  
  @override
  List<Object> get props => [];
}

class ListWorkshopInProcess extends ListWorkshopState{
  
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListWorkshopInProcess {}';
}

class ListWorkshopSuccess extends ListWorkshopState{

  final List<Workshop> workshops;

  ListWorkshopSuccess(this.workshops);
  
  @override
  List<Object> get props => [workshops];

  @override
  String toString() => 'ListWorkshopSuccess { workshops: $workshops}';
}

class ListWorkshopFailure extends ListWorkshopState{

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListWorkshopFailure {}';
}