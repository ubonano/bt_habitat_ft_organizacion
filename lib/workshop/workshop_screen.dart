import 'package:bt_habitat_ft_organizacion/moment/add/bloc/add_moment_bloc.dart';
import 'package:bt_habitat_ft_organizacion/moment/list/bloc/list_moment_bloc.dart';
import 'package:bt_habitat_ft_organizacion/moment/moment_model.dart';
import 'package:bt_habitat_ft_organizacion/moment/moment_widget.dart';
import 'package:bt_habitat_ft_organizacion/workshop/delete/bloc/delete_workshop_bloc.dart';
import 'package:bt_habitat_ft_organizacion/workshop/workshop_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkshopScreen extends StatelessWidget {
  final Workshop workshop;

  const WorkshopScreen({Key key, @required this.workshop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListMomentBloc>(
          create: (_) => ListMomentBloc(workshop.id)..add(ListMomentStarted()),
        ),
        BlocProvider<DeleteWorkshopBloc>(
          create: (_) => DeleteWorkshopBloc(),
        ),
        BlocProvider<AddMomentBloc>(
          create: (_) => AddMomentBloc(workshop.id),
        ),
      ],
      child: _Workshop(
        workshop: workshop,
      ),
    );
  }
}

class _Workshop extends StatefulWidget {
  final Workshop workshop;

  const _Workshop({Key key, @required this.workshop}) : super(key: key);

  @override
  __WorkshopState createState() => __WorkshopState();
}

class __WorkshopState extends State<_Workshop> with TickerProviderStateMixin {
  bool _collapsed = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<DeleteWorkshopBloc, DeleteWorkshopState>(
            listener: (context, state) {
          if (state is DeleteWorkshopSuccess) {
            Navigator.pop(context);
          }
        }),
        BlocListener<AddMomentBloc, AddMomentState>(
          listener: (context, state) {
            if (state is AddMomentSuccess) {
              Navigator.pop(context);
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => BlocProvider.of<DeleteWorkshopBloc>(context)
                    .add(DeleteWorkshopStarted(widget.workshop.id))),
          ],
        ),
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _buildSentence('Titulo', widget.workshop.title),
                    _buildSentence('Objetivo', widget.workshop.description),
                    _buildHeaderMoment(
                        context, BlocProvider.of<AddMomentBloc>(context)),
                    _buildBodyMoments(widget.workshop.id),
                  ],
                ),
              ),
            ],
          ),
        ),
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

  Widget _buildBodyMoments(String workshopId) {
    return BlocBuilder<ListMomentBloc, ListMomentState>(
      builder: (context, state) {
        if (state is ListMomentSuccess) {
          List<Moment> moments = state.moments;

          return AnimatedSize(
            duration: Duration(milliseconds: 500),
            curve: Curves.fastOutSlowIn,
            reverseDuration: Duration(milliseconds: 500),
            vsync: this,
            child: Container(
              width: 500,
              constraints: (_collapsed)
                  ? BoxConstraints(maxHeight: double.infinity)
                  : BoxConstraints(maxHeight: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              color: Colors.blueGrey,
              child: Column(
                children: moments
                    .map((m) => MomentWidget(workshopId: workshopId, moment: m))
                    .toList(),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildHeaderMoment(BuildContext context, AddMomentBloc addMomentBloc) {
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
              onPressed: () => _addMoment(context, addMomentBloc)),
          IconButton(
              icon: (_collapsed)
                  ? Icon(Icons.keyboard_arrow_up, size: 30, color: Colors.white)
                  : Icon(Icons.keyboard_arrow_down,
                      size: 30, color: Colors.white),
              onPressed: () {
                setState(() {
                  _collapsed = !_collapsed;
                });
              }),
        ],
      ),
    );
  }

  void _addMoment(BuildContext context, AddMomentBloc addMomentBloc) {
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
            onPressed: () => addMomentBloc
                .add(AddMomentStarted(Moment(title: ctrlTitle.text))),
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
