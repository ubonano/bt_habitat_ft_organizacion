import 'package:bt_habitat_ft_organizacion/pages/detail_panel_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailWorkshopPage extends StatefulWidget {
  final String workshopName;

  const DetailWorkshopPage({Key key, this.workshopName}) : super(key: key);

  @override
  _DetailWorkshopPageState createState() => _DetailWorkshopPageState();
}

class _DetailWorkshopPageState extends State<DetailWorkshopPage>
    with TickerProviderStateMixin {
  TextEditingController controllerSection = TextEditingController();
  TextEditingController controllerClasses = TextEditingController();

  bool collapse = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
//        title: Text(widget.workshopName),
          ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              margin: EdgeInsets.only(top: 30),
//            width: MediaQuery.of(context).size.width,
              child: _buildPrincipalPage()),
        ),
      ),
    );
  }

  Widget _buildPrincipalPage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Titulo: ',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.workshopName,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.edit,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Description: ',
              style: TextStyle(fontSize: 20, color: Colors.red),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Este es un taller destinado para la demo',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.edit,
              color: Colors.grey,
              size: 20,
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        _buildSectionsPanel()
      ],
    );
  }

  Widget _buildSectionsPanel() {
    final double width = 800;
    return Container(
        width: width,
        color: Colors.blueAccent,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
            width: width,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 25,
                ),
                Expanded(
                  child: Text(
                    'Secciones',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () => {})
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              DetailPanelPage(sectionName: 'Seccion 1',),
              DetailPanelPage(sectionName: 'Seccion 2',),
            ]),
          ),
        ]));
  }

}
