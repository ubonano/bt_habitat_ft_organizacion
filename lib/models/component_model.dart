import 'package:meta/meta.dart';

import 'package:bt_habitat_ft_organizacion/entities/component_entity.dart';

@immutable
class Component {
  static const String collectionName = 'components';
  
  final String id;
  final String title;
  final String type;

  Component({String id, String title = '', String type = ''})
       : this.id = id,
         this.title = title ?? '',
         this.type = type ?? '';

  Component copyWith({String id, String title, String type}) {
    return Component(
      id: id ?? this.id,
      title: title ?? this.title,
      type: type ?? this.type,
    );
  }

  @override
  int get hashCode =>
      id.hashCode ^ title.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Component &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title &&
          type == other.type;

  @override
  String toString() {
    return 'Component { id: $id, title: $title, type: $type }';
  }

  ComponentEntity toEntity() {
    return ComponentEntity(id, title, type);
  }

  static Component fromEntity(ComponentEntity entity) {
    return Component(
      id: entity.id,
      title: entity.title,
      type: entity.type,
    );
  }
}
