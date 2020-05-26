part of 'list_moment_bloc.dart';

abstract class ListMomentState extends Equatable {
  const ListMomentState();
}

class ListMomentInitial extends ListMomentState {
  @override
  List<Object> get props => [];
}

class ListMomentInProcess extends ListMomentState {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ListMomentInProcess {}';
}

class ListMomentSuccess extends ListMomentState {
  final List<Moment> moments;

  ListMomentSuccess(this.moments);

  @override
  List<Object> get props => [moments];

  @override
  String toString() => 'ListMomentSuccess { moments: $moments}';
}
