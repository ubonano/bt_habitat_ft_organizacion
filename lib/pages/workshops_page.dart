import 'package:bt_habitat_ft_organizacion/pages/detail_workshop_page.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WorkShopsPage extends StatefulWidget {
  @override
  _WorkShopsPageState createState() => _WorkShopsPageState();
}


class _WorkShopsPageState extends State<WorkShopsPage> {
  TextEditingController controllerTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workshops'),
      ),
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: Container()),
      ),
    );
  }
}
