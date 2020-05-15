part of 'moments_bloc.dart';

abstract class MomentsEvent extends Equatable {
  const MomentsEvent();
}

class MomentsLoadStarted extends MomentsEvent{

  @override
  List<Object> get props => [];
}

class MomentsLoadLoaded extends MomentsEvent{

  final List<Moment> moments;

  MomentsLoadLoaded(this.moments);

  @override
  List<Object> get props => [moments];

}
