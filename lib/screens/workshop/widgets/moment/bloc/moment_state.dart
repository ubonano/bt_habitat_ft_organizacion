part of 'moment_bloc.dart';

abstract class MomentState extends Equatable {
  const MomentState();
}

class MomentInitial extends MomentState {
  @override
  List<Object> get props => [];
}
