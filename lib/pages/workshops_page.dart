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
            child: StreamBuilder(
                stream: Firestore.instance.collection('workshops').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      return Wrap(
                        alignment: WrapAlignment.center,
                        children: snapshot.data.documents
                            .map((e) =>
                                _buildWorkshopContainer(context, e))
                            .toList(),
                      );
                  }
                })),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _showDialog();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildWorkshopContainer(BuildContext context, DocumentSnapshot document) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  DetailWorkshopPage(workshopName: document.data['title'],))),
      child: Container(
        margin: EdgeInsets.all(30),
        padding: EdgeInsets.all(20),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.redAccent],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              document.data['title'],
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Nuevo Taller'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: controllerTitle,
              decoration: InputDecoration(
                  labelText: 'Titulo', hintText: 'Ingrese un titulo'),
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          FlatButton(
            onPressed: () {
              setState(() {
                _createWorkshop(this.controllerTitle.text);
                this.controllerTitle.text = "";
                Navigator.pop(context);
              });
            },
            child: Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  void _createWorkshop(String workshopName) {
    Firestore.instance
        .collection('workshops')
        .document(workshopName)
        .setData({'title': workshopName});
  }
}
