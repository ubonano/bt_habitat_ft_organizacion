import 'package:bt_habitat_ft_organizacion/entities/moment_entity.dart';
import 'package:meta/meta.dart';

@immutable
class Moment {
  static const String collectionName = 'moments';
  
  final String id;
  final String title;

  Moment({String id, String title = ''})
       : this.id = id,
         this.title = title ?? '';

  Moment copyWith({String id, String title}) {
    return Moment(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Moment &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title;

  @override
  String toString() {
    return 'Moment { id: $id, title: $title }';
  }

  MomentEntity toEntity() {
    return MomentEntity(id, title);
  }

  static Moment fromEntity(MomentEntity entity) {
    return Moment(
      id: entity.id,
      title: entity.title,
    );
  }
}
