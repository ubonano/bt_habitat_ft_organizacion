import 'package:bt_habitat_ft_organizacion/entities/moment_entity.dart';
import 'package:bt_habitat_ft_organizacion/models/moment_model.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/moment_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MomentFirebaseRepository extends MomentRepository {
  CollectionReference momentsReference;

  MomentFirebaseRepository(String workshopDocumentId) {
    this.momentsReference = Firestore.instance
        .collection(Workshop.collectionName)
        .document(workshopDocumentId)
        .collection(Moment.collectionName);
  }

  @override
  Stream<List<Moment>> all() {
    return momentsReference.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Moment.fromEntity(MomentEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}
