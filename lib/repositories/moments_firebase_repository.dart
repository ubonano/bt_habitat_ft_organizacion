import 'package:bt_habitat_ft_organizacion/entities/moment_entity.dart';
import 'package:bt_habitat_ft_organizacion/models/moment_model.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/moments_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MomentsFirebaseRepository extends MomentsRepository {
  CollectionReference momentsReference;

  MomentsFirebaseRepository(String workshopDocumentId) {
    this.momentsReference = Firestore.instance
        .collection(Workshop.collectionName)
        .document(workshopDocumentId)
        .collection(Moment.collectionName);
  }

  @override
  Stream<List<Moment>> moments() {
    return momentsReference.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Moment.fromEntity(MomentEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}
