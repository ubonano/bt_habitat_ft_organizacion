import 'package:bt_habitat_ft_organizacion/entities/workshop_entity.dart';
import 'package:meta/meta.dart';

@immutable
class Workshop {
  static const String collectionName = 'workshops';
  
  final String id;
  final String title;
  final String description;

  Workshop({String id, String title = '', String description = ''})
       : this.id = id,
         this.title = title ?? '',
         this.description = description ?? '';

  Workshop copyWith({String id, String title, String description}) {
    return Workshop(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
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
          title == other.title &&
          description == other.description;

  @override
  String toString() {
    return 'Workshop { id: $id, title: $title, description: $description }';
  }

  WorkshopEntity toEntity() {
    return WorkshopEntity(id, title, description);
  }

  static Workshop fromEntity(WorkshopEntity entity) {
    return Workshop(
      id: entity.id,
      title: entity.title,
      description: entity.description,
    );
  }
}
