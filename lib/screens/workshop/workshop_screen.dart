import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/bloc/workshop_bloc.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/widgets/moments/moments_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkshopScreen extends StatelessWidget {
  final Workshop workshop;

  const WorkshopScreen({Key key, @required this.workshop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider<WorkshopBloc>(
        create: (context) => WorkshopBloc(),
        child: SingleChildScrollView(
          child: BlocBuilder<WorkshopBloc, WorkshopState>(
            builder: (context, state) {
              return Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    _buildSentence('Titulo', workshop.title),
                    _buildSentence('Objetivo', workshop.description),
                    MomentsWidget(
                      workshop: workshop,
                    ),
                  ],
                ),
              );
            },
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
}
