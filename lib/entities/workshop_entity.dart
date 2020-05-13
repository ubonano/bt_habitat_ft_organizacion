import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class WorkshopEntity extends Equatable {
  final String id;
  final String title;
  final String description;


  const WorkshopEntity(this.id, this.title, this.description,);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description
    };
  }

  @override
  List<Object> get props => [id, title, description];

  @override
  String toString() {
    return 'WorkshopEntity { id: $id, title: $title, description: $description }';
  }

  static WorkshopEntity fromJson(Map<String, Object> json) {
    return WorkshopEntity(
      json["id"] as String,
      json["title"] as String,
      json["description"] as String,
    );
  }

  static WorkshopEntity fromSnapshot(DocumentSnapshot snap) {
    return WorkshopEntity(
      snap.documentID,
      snap.data['title'],
      snap.data['description'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "title": title,
      "description": description,
    };
  }
}
