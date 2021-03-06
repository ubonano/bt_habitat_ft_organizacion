import 'package:bt_habitat_ft_organizacion/component/model/component.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:bt_habitat_ft_organizacion/moment/moment_model.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_model.dart';

class ComponentRepository {
  CollectionReference componentReference;

  ComponentRepository(String workshopId, String momentId) {
    this.componentReference = Firestore.instance
        .collection(Workshop.collectionName)
        .document(workshopId)
        .collection(Moment.collectionName)
        .document(momentId)
        .collection(Component.collectionName);
  }

  Stream<List<Component>> all() {
    return componentReference.snapshots().map((snapshot) =>
        snapshot.documents.map((doc) => Component.fromDocument(doc)).toList());
  }

  Future<void> add(Component component) async {
    componentReference.add(Component.toDocument(component));
  }

}
