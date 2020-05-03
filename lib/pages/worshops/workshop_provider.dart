// Iriamos a Firebase a buscar los talleres

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class WorkshopProvider with ChangeNotifier {
  String title;
  String objective;

  List<String> _list = [""];

  List<String> get list => _list;

  set list(List<String> list) {
    _list = list;
    notifyListeners();
  }

  void listTitle() async {
    List<String> lista = [];

    list = lista;

    Firestore.instance.collection('workshops').snapshots().listen((event) {
      lista.clear();
      event.documents.forEach((e) {
        lista.add(e.data["title"]);
        list = lista;
      });
    });
  }
}
