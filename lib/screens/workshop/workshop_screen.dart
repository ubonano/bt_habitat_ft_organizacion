import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/widgets/delete_workshop/bloc/delete_workshop_bloc.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/widgets/delete_workshop/delete_workshop_widget.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/widgets/moments/moments_widget.dart';
import 'package:bt_habitat_ft_organizacion/widgets/message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkshopScreen extends StatelessWidget {
  final Workshop workshop;

  const WorkshopScreen({Key key, @required this.workshop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteWorkshopBloc, DeleteWorkshopState>(
      listener: _deleteListener,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            DeleteWorkshopWidget(
              workshopId: workshop.id,
            ),
          ],
        ),
        body: BlocBuilder<DeleteWorkshopBloc, DeleteWorkshopState>(
          builder: (context, state) {
            if (state is DeleteWorkshopInProcess) {
              return MessageDialog(message: 'Eliminando');
            } else {
              return SingleChildScrollView(
                child: Container(
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
                ),
              );
            }
          },
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

  void _deleteListener(BuildContext context, DeleteWorkshopState state){
    if(state is DeleteWorkshopSuccess){
      Navigator.pop(context);
    }
  }
}
