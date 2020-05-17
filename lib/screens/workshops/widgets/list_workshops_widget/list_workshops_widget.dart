import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshop_firebase_repository.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/workshop_screen.dart';
import 'bloc/list_workshops_bloc.dart';

class ListWorkshopsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ListWorkshopsBloc>(
      create: (context) =>
          ListWorkshopsBloc(workshopRepository: WorkshopFirebaseRepository())
            ..init(),
      child: _Workshops(),
    );
  }
}

class _Workshops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ListWorkshopsBloc, ListWorkshopsState>(
      listener: (context, state) {
        if (state is ListWorkshopsInProcess) {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              content: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cargando ....',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        }else if (state is ListWorkshopsSuccess){
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<ListWorkshopsBloc, ListWorkshopsState>(
        builder: (context, state) {
          if (state is ListWorkshopsSuccess) {
            return _buildWorkshops(state.workshops);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  ListView _buildWorkshops(List<Workshop> workshops) {
    return ListView.builder(
      itemCount: workshops.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(workshops[index].title),
        subtitle: Text(workshops[index].description),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkshopScreen(workshop: workshops[index]),
          ),
        ),
      ),
    );
  }
}
