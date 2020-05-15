import 'package:bt_habitat_ft_organizacion/entities/workshop_entity.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshops_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkshopsFirebaseRepository extends WorkshopsRepository{

  final workshopCollection = Firestore.instance.collection(Workshop.collectionName);

  @override
  Stream<List<Workshop>> workshops() {
    return workshopCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Workshop.fromEntity(WorkshopEntity.fromSnapshot(doc)))
          .toList();
    });
  }

  @override
  Future<void> addNewWorkshop(Workshop workshop) {
    return workshopCollection.add(workshop.toEntity().toDocument());
  }

}