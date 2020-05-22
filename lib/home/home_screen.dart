import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bt_habitat_ft_organizacion/workshop/bloc/workshop_bloc.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkshopBloc>(
      create: (context) => WorkshopBloc()..add(ListWorkshopStarted()),
      child: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkshopBloc, WorkshopState>(
      listener: (context, state) {
        if (state is AddWorkshopSuccess) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Talleres'),
          ),
          body: _buildWorshopsItem(),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _buildAddWorkshop(
                  context, BlocProvider.of<WorkshopBloc>(context)))),
    );
  }

  Widget _buildWorshopsItem() {
    return BlocBuilder<WorkshopBloc, WorkshopState>(
      builder: (context, state) {
        if (state is ListWorkshopInProcess) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ListWorkshopSuccess) {
          List<Workshop> workshops = state.workshops;

          return ListView.builder(
            itemCount: workshops.length,
            itemBuilder: (context, index) => ListTile(
                title: Text(workshops[index].title ?? ''),
                subtitle: Text(workshops[index].description ?? ''),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WorkshopScreen(workshop: workshops[index]),
                    ))),
          );
        } else {
          return Center(
              child: Container(width: 50, height: 50, color: Colors.yellow));
        }
      },
    );
  }

  void _buildAddWorkshop(BuildContext context, WorkshopBloc workshopBloc) {
    final TextEditingController textControllerWorkshop =
        TextEditingController();
    final TextEditingController textControllerObjetive =
        TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Crear una taller'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              controller: textControllerWorkshop,
              decoration: InputDecoration(
                  labelText: 'Nombre del taller',
                  hintText: 'Ingrese el nombre del taller'),
            ),
            TextFormField(
              controller: textControllerObjetive,
              decoration: InputDecoration(
                  labelText: 'Objetivo del taller',
                  hintText: 'Ingrese el objetivo'),
            ),
          ],
        ),
        actions: <Widget>[
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
          RaisedButton(
            onPressed: () => workshopBloc.add(AddWorkshopStarted(Workshop(
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
      ),
    );
  }
}
