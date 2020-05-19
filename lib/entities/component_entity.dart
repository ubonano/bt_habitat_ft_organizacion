import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class ComponentEntity extends Equatable {
  final String id;
  final String title;
  final String type;


  const ComponentEntity(this.id, this.title, this.type,);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "title": title,
      "type": type,
    };
  }

  @override
  List<Object> get props => [id, title, type];

  @override
  String toString() {
    return 'ComponentEntity { id: $id, title: $title, type: $type }';
  }

  static ComponentEntity fromJson(Map<String, Object> json) {
    return ComponentEntity(
      json['id'] as String,
      json['title'] as String,
      json['type'] as String,
    );
  }

  static ComponentEntity fromSnapshot(DocumentSnapshot snap) {
    return ComponentEntity(
      snap.documentID,
      snap.data['title'],
      snap.data['type'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      'title': title,
      'type': type,
    };
  }
}
