import 'package:bt_habitat_ft_organizacion/entities/component_entity.dart';
import 'package:bt_habitat_ft_organizacion/models/component_model.dart';
import 'package:bt_habitat_ft_organizacion/models/moment_model.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../component_repository.dart';

class ComponentFirebaseRepository extends ComponentRepository {
  CollectionReference componentReference;

  ComponentFirebaseRepository(String workshopId, String momentId) {
    this.componentReference = Firestore.instance
        .collection(Workshop.collectionName)
        .document(workshopId)
        .collection(Moment.collectionName)
        .document(momentId)
        .collection(Component.collectionName);
  }

  @override
  Stream<List<Component>> all() {
    return componentReference.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Component.fromEntity(ComponentEntity.fromSnapshot(doc)))
          .toList();
    });
  }
}
