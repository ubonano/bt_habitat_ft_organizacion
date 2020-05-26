part of 'delete_moment_bloc.dart';

abstract class DeleteMomentEvent extends Equatable {
  const DeleteMomentEvent();
}

class DeleteMomentStarted extends DeleteMomentEvent {
  final String momentId;

  DeleteMomentStarted(this.momentId);

  @override
  List<Object> get props => [momentId];

  @override
  String toString() => 'DeleteMomentStarted { momentId: $momentId }';
}
