import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class WorkshopEntity extends Equatable {
  final String id;
  final String title;


  const WorkshopEntity(this.id, this.title);

  Map<String, Object> toJson() {
    return {
      "id": id,
      "title": title,
    };
  }

  @override
  List<Object> get props => [id, title];

  @override
  String toString() {
    return 'WorkshopEntity { id: $id, title: $title }';
  }

  static WorkshopEntity fromJson(Map<String, Object> json) {
    return WorkshopEntity(
      json["id"] as String,
      json["title"] as String,
    );
  }

  static WorkshopEntity fromSnapshot(DocumentSnapshot snap) {
    return WorkshopEntity(
      snap.documentID,
      snap.data['title'],
    );
  }

  Map<String, Object> toDocument() {
    return {
      "title": title,
    };
  }
}
