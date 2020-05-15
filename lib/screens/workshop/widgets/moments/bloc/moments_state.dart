part of 'moments_bloc.dart';

abstract class MomentsState extends Equatable {
  const MomentsState();
}

class MomentsInitial extends MomentsState {
  @override
  List<Object> get props => [];
}

class MomentsLoadInProgress extends MomentsState{
  
  @override
  List<Object> get props => [];
}

class MomentsLoadSuccess extends MomentsState{
  final List<Moment> moments;

  MomentsLoadSuccess(this.moments);

  @override
  List<Object> get props => [moments];

}
