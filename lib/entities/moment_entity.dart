import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class MomentEntity extends Equatable {
  final String id;
  final String title;


  const MomentEntity(this.id, this.title,);

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
    return 'MomentEntity { id: $id, title: $title }';
  }

  static MomentEntity fromJson(Map<String, Object> json) {
    return MomentEntity(
      json["id"] as String,
      json["title"] as String,
    );
  }

  static MomentEntity fromSnapshot(DocumentSnapshot snap) {
    return MomentEntity(
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
