import 'package:bt_habitat_ft_organizacion/entities/workshop_entity.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshop_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkshopFirebaseRepository extends WorkshopRepository {

  static final WorkshopFirebaseRepository _workshopFirebaseRepository = WorkshopFirebaseRepository._internal();


  factory WorkshopFirebaseRepository(){
    return _workshopFirebaseRepository;
  }

  WorkshopFirebaseRepository._internal();

  final _workshopCollection =
      Firestore.instance.collection(Workshop.collectionName);

  @override
  Stream<List<Workshop>> all() {
    return _workshopCollection.snapshots().map((snapshot) => snapshot.documents
        .map((doc) => Workshop.fromEntity(WorkshopEntity.fromSnapshot(doc)))
        .toList());
  }

  @override
  Future<void> add(Workshop workshop) {
    return _workshopCollection.add(workshop.toEntity().toDocument());
  }

  @override
  Future<void> delete(String workshopId) {
    return _workshopCollection.document(workshopId).delete();
  }
}
