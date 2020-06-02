import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bt_habitat_ft_organizacion/workshop/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/moment/moment_model.dart';

class MomentRepository {
  CollectionReference _momentsReference;

  MomentRepository(String workshopDocumentId) {
    this._momentsReference = Firestore.instance
        .collection(Workshop.collectionName)
        .document(workshopDocumentId)
        .collection(Moment.collectionName);
  }

  Stream<List<Moment>> all() {
    return _momentsReference.snapshots().map((snapshot) {
      return snapshot.documents.map((doc) => Moment.fromDocument(doc)).toList();
    });
  }

  Future<void> add(Moment moment) async {
    _momentsReference.add(moment.toDocument());
  }

  Future<void> delete(String momentId) async {
    _momentsReference.document(momentId).delete();
  }
}
