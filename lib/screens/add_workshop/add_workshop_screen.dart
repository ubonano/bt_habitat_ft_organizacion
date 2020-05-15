import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshop_firebase_repository.dart';
import 'package:bt_habitat_ft_organizacion/screens/add_workshop/bloc/add_workshop_bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWorkshopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crear un taller'),
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider<AddWorkshopBloc>(
        create: (context) =>
            AddWorkshopBloc(workshopRepository: WorkshopFirebaseRepository()),
        child: _CreateWorkshop(),
      ),
    );
  }
}

class _CreateWorkshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AddWorkshopBloc createWorkshopBloc =
        BlocProvider.of<AddWorkshopBloc>(context);

    return BlocBuilder<AddWorkshopBloc, AddWorkshopState>(
      builder: (context, state) {
        if (state is AddWorkshopInitial) {
          return _buildInitialScreen(context, createWorkshopBloc);
        } else if (state is AddWorkshopInProcess) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AddWorkshopSuccess) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Se ha creado con exito el taller',
                  style: TextStyle(fontSize: 18, color: Colors.green),
                ),
                SizedBox(
                  height: 30,
                ),
                RaisedButton(
                  child: Text('Aceptar'),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        } else if (state is AddWorkshopFailure) {
          return Container();
        }
      },
    );
  }

  Widget _buildInitialScreen(
      BuildContext context, AddWorkshopBloc createWorkshopBloc) {
    final TextEditingController textControllerWorkshop =
        TextEditingController();
    final TextEditingController textControllerObjetive =
        TextEditingController();

    return Center(
      child: Container(
        width: 300,
        height: 300,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[400],
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildTextFormField('Nombre del taller',
                'Ingrese el nombre del taller', textControllerWorkshop),
            _buildTextFormField('Objetivo del taller', 'Ingrese el objetivo',
                textControllerObjetive),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancelar"),
                  color: Colors.white,
                  textColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                RaisedButton(
                  onPressed: () => createWorkshopBloc.add(AddWorkshopStarted(
                      Workshop(
                          title: textControllerWorkshop.text,
                          description: textControllerObjetive.text ?? ''))),
                  child: Text("Aceptar"),
                  color: Colors.white,
                  textColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextFormField(
      String title, String hintext, TextEditingController controller) {
    return Container(
      width: 300,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(labelText: title, hintText: hintext),
      ),
    );
  }
}
