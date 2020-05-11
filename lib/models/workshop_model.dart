import 'package:bt_habitat_ft_organizacion/entities/workshop_entity.dart';
import 'package:meta/meta.dart';

@immutable
class Workshop {
  static const String collectionName = 'workshops';
  
  final String id;
  final String title;

  Workshop({String id, String title = ''})
       : this.id = id,
         this.title = title ?? '';

  Workshop copyWith({String id, String title}) {
    return Workshop(
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
      other is Workshop &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title;

  @override
  String toString() {
    return 'Workshop { id: $id, title: $title }';
  }

  WorkshopEntity toEntity() {
    return WorkshopEntity(id, title);
  }

  static Workshop fromEntity(WorkshopEntity entity) {
    return Workshop(
      id: entity.id,
      title: entity.title,
    );
  }
}
