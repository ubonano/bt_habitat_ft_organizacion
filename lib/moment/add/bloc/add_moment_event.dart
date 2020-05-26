part of 'add_moment_bloc.dart';

abstract class AddMomentEvent extends Equatable {
  const AddMomentEvent();
}

class AddMomentStarted extends AddMomentEvent {
  final Moment moment;

  AddMomentStarted(this.moment);

  @override
  List<Object> get props => [moment];

  @override
  String toString() => 'AddMomentStarted { moment: ${moment.toString()} }';
}
