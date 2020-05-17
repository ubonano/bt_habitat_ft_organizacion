import 'package:flutter/material.dart';

import 'widgets/list_workshops_widget/list_workshops_widget.dart';



class WorkshopsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talleres"),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: ListWorkshopsWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/addworkshop'),
        child: Icon(Icons.add),
      ),
    );
  }
}

