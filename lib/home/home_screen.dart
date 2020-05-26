import 'dart:math';

import 'package:bt_habitat_ft_organizacion/workshop/add/bloc/add_workshop_bloc.dart';
import 'package:bt_habitat_ft_organizacion/workshop/list/bloc/list_workshop_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bt_habitat_ft_organizacion/workshop/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListWorkshopBloc>(
            create: (context) =>
                ListWorkshopBloc()..add(ListWorkshopStarted())),
        BlocProvider<AddWorkshopBloc>(
          create: (context) => AddWorkshopBloc(),
        )
      ],
      child: _Home(),
    );
  }
}

class _Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddWorkshopBloc, AddWorkshopState>(
      listener: (context, state) {
        if (state is AddWorkshopSuccess) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text('Talleres'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  width: 500,
                  padding: EdgeInsets.only(top: 20),
                  child: _buildWorshopsItem()),
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _buildAddWorkshop(
                  context, BlocProvider.of<AddWorkshopBloc>(context)))),
    );
  }

  Widget _buildWorshopsItem() {

    Random rnd = new Random();

    return BlocBuilder<ListWorkshopBloc, ListWorkshopState>(
      builder: (context, state) {
        if (state is ListWorkshopInProcess) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ListWorkshopSuccess) {
          List<Workshop> workshops = state.workshops;

          return ListView.builder(
            itemCount: workshops.length,
            itemBuilder: (context, index) => Column(
              children: <Widget>[
                ListTile(
                  leading: CircleAvatar(backgroundColor: Color.fromARGB(rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255), rnd.nextInt(255)),),
                  title: Text(workshops[index].title ?? ''),
                  subtitle: Text(workshops[index].description ?? ''),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WorkshopScreen(workshop: workshops[index]),
                    ),
                  ),
                ),
                Container(
                    width: double.infinity, height: 2, color: Colors.grey[300]),
              ],
            ),
          );
        } else {
          return Center(
              child: Container(width: 50, height: 50, color: Colors.yellow));
        }
      },
    );
  }

  void _buildAddWorkshop(
      BuildContext context, AddWorkshopBloc addWorkshopBloc) {
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
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
          ),
          FlatButton(
            onPressed: () => addWorkshopBloc.add(AddWorkshopStarted(Workshop(
                title: textControllerWorkshop.text,
                description: textControllerObjetive.text ?? ''))),
            child: Text('Aceptar',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 17,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
