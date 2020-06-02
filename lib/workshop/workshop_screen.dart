import 'package:bt_habitat_ft_organizacion/moment/moment_model.dart';
import 'package:bt_habitat_ft_organizacion/moment/moment_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bt_habitat_ft_organizacion/moment/bloc/moment_bloc.dart';
import 'package:bt_habitat_ft_organizacion/workshop/bloc/workshop_bloc.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_model.dart';

class WorkshopScreen extends StatelessWidget {
  final Workshop workshop;

  const WorkshopScreen({Key key, @required this.workshop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkshopBloc>(
          create: (_) => WorkshopBloc(),
        ),
        BlocProvider<MomentBloc>(
          create: (_) => MomentBloc(workshop.id)..add(ListMomentStarted()),
        )
      ],
      child: _Workshop(
        workshop: workshop,
      ),
    );
  }
}

class _Workshop extends StatelessWidget {
  final Workshop workshop;

  const _Workshop({Key key, @required this.workshop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WorkshopBloc, WorkshopState>(listener: (context, state) {
          if (state is DeleteWorkshopSuccess) {
            Navigator.pop(context);
          }
        }),
        BlocListener<MomentBloc, MomentState>(
          listener: (context, state) {
            if (state is AddMomentSuccess) {
              Navigator.pop(context);
            }
          },
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => BlocProvider.of<WorkshopBloc>(context)
                    .add(DeleteWorkshopStarted(workshop.id))),
          ],
        ),
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 500,
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    _buildSentence('Titulo', workshop.title),
                    _buildSentence('Objetivo', workshop.description),
                    _buildHeaderMoment(
                        context, BlocProvider.of<MomentBloc>(context)),
                    _buildMoments(workshop.id),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderMoment(BuildContext context, MomentBloc momentBloc) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      height: 40,
      color: Colors.blueGrey,
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Momentos',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(child: Container()),
          IconButton(
              icon: Icon(Icons.add, color: Colors.white),
              onPressed: () => _addMoment(context, momentBloc)),
        ],
      ),
    );
  }

  void _addMoment(BuildContext context, MomentBloc momentBloc) {
    TextEditingController ctrlTitle = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Agregar un Momento'),
        content: TextFormField(
          controller: ctrlTitle,
          decoration: InputDecoration(
            hintText: 'Nombre del momento',
            labelText: 'Nombre',
          ),
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
            onPressed: () =>
                momentBloc.add(AddMomentStarted(Moment(title: ctrlTitle.text))),
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

  Widget _buildSentence(String title, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            '$title:',
            style: TextStyle(
                color: Color(0xFF3333ff),
                fontWeight: FontWeight.bold,
                fontSize: 17),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            '$text',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ],
      ),
    );
  }

  Widget _buildMoments(String workshopId) {
    return BlocBuilder<MomentBloc, MomentState>(
      builder: (context, state) {
        if (state is ListMomentSuccess) {
          List<Moment> moments = state.moments;

          return Container(
            width: 500,
            padding: EdgeInsets.symmetric(horizontal: 15),
            color: Colors.blueGrey,
            child: Column(
              children: moments
                  .map(
                    (m) => MomentWidget(
                      workshopId: workshopId,
                      moment: m,
                    ),
                  )
                  .toList(),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
