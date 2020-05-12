import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshops_firebase_repository.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshops/bloc/workshops_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkshopsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkshopsBloc>(
      create: (context) => WorkshopsBloc(workshopsRepository: WorkshopsFirebaseRepository())
        ..init(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Talleres"),
        ),
        body: _Workshops(),
        floatingActionButton: _CreateWorkshopFAB(),
      ),
    );
  }
}

class _CreateWorkshopFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final workshopsBloc = BlocProvider.of<WorkshopsBloc>(context);

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return _buildCreateWorkshopDialog(context, workshopsBloc);
          },
        );
      },
    );
  }

  Widget _buildCreateWorkshopDialog(BuildContext context, WorkshopsBloc workshopsBloc) {
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

class _Workshops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks

    return BlocBuilder<WorkshopsBloc, WorkshopsState>(
      builder: (context, state) {
        if (state is WorkshopsLoadSuccess) {
          return _buildWorkshops(context, state.workshops);
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildWorkshops(BuildContext context, List<Workshop> workshops) {
    return ListView.builder(
      itemCount: workshops.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(workshops[index].title),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {},
      ),
    );
  }
}
