import 'package:animations/animations.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshops_firebase_repository.dart';

import 'package:bt_habitat_ft_organizacion/screens/create_workshop/create_workshop_screen.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/workshop_screen.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshops/bloc/workshops_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkshopsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocProvider<WorkshopsBloc>(
      create: (context) =>
          WorkshopsBloc(workshopsRepository: WorkshopsFirebaseRepository())..init(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Talleres"),
        ),
        backgroundColor: Colors.white,
        body: _Workshops(),
        floatingActionButton: _floatingActionButton(),
      ),
    );
  }

  Widget _floatingActionButton() {
    return OpenContainer(
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      closedBuilder: (context, action) {
        return FloatingActionButton(
          onPressed: action,
          child: Icon(Icons.add),
        );
      },
      openBuilder: (context, action) {
        return CreateWorkshopScreen();
      },
    );
  }
}

class _Workshops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkshopsBloc, WorkshopsState>(
      builder: (context, state) {
        if (state is WorkshopsInitial || state is WorkshopsLoadInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is WorkshopsLoadSuccess) {
          return _buildWorkshops(state.workshops);
        } else {
          return Container();
        }
      },
    );
  }

  ListView _buildWorkshops(List<Workshop> workshops) {
    return ListView.builder(
      itemCount: workshops.length,
      itemBuilder: (context, index) => OpenContainer(
        closedElevation: 0,
        closedBuilder: (context, action) => _buildWorkshop(workshops[index]),
        openBuilder: (context, action) => WorkshopScreen(
          workshop: workshops[index],
        ),
      ),
    );
  }

  Widget _buildWorkshop(Workshop workshop) {
    return ListTile(
      title: Text(workshop.title),
      subtitle: Text(workshop.description),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
