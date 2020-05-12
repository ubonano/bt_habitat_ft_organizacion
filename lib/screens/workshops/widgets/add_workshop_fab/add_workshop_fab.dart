import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshops/bloc/workshops_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddWorkshopFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final workshopsBloc = BlocProvider.of<WorkshopsBloc>(context);

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return _buildAddWorkshopDialog(context, workshopsBloc);
          },
        );
      },
    );
  }

  Widget _buildAddWorkshopDialog(BuildContext context, WorkshopsBloc workshopsBloc) {
    final titleController = TextEditingController();

    return AlertDialog(
      title: Text("Crear taller"),
      content: TextField(
        controller: titleController,
        autofocus: true,
        decoration: InputDecoration(
            border: InputBorder.none, hintText: 'Titulo del taller'),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text("Cancelar"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("Nuevo"),
          onPressed: () {
            workshopsBloc.add(WorkshopsCreated(Workshop(title: titleController.text)));
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}