import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bt_habitat_ft_organizacion/workshop/bloc/workshop_bloc.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_model.dart';

class AddWorkshopScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<WorkshopBloc>(
        create: (context) => WorkshopBloc(),
        child: _AddWorkshop(),
      ),
    );
  }
}

class _AddWorkshop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textControllerWorkshop =
        TextEditingController();
    final TextEditingController textControllerObjetive =
        TextEditingController();

    return BlocListener<WorkshopBloc, WorkshopState>(
      listener: (context, state) {
        if (state is AddWorkshopSuccess) {
          Navigator.pop(context);
        }
      },
      child: Container(
        child: Column(
          children: <Widget>[
            _buildTextFormField('Nombre del taller',
                'Ingrese el nombre del taller', textControllerWorkshop),
            _buildTextFormField('Objetivo del taller', 'Ingrese el objetivo',
                textControllerObjetive),
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
                  onPressed: () => BlocProvider.of<WorkshopBloc>(context).add(
                      AddWorkshopStarted(Workshop(
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
