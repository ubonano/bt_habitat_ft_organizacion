import 'package:animations/animations.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshops_firebase_repository.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/workshop_screen.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshops/bloc/workshops_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkshopsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: BlocProvider<WorkshopsBloc>(
        create: (context) =>
            WorkshopsBloc(workshopsRepository: WorkshopsFirebaseRepository())
              ..init(),
        child: _Workshops(),
      ),
    );
  }
}

class _Workshops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<WorkshopsBloc, WorkshopsState>(
      builder: (context, state) {
        if (state is WorkshopsInitial || state is WorkshopsLoadInProgress)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (state is WorkshopsLoadSuccess) {
          return _buildWorkshops(state);
        }else{
          return Container();
        }
      },
    );
  }

  ListView _buildWorkshops(WorkshopsLoadSuccess state) {

    final List<Workshop> workshops = state.workshops;

    return ListView.builder(
          itemCount: state.workshops.length,
          itemBuilder: (context, index) => OpenContainer(
            closedElevation: 0,
            closedBuilder: (context, action) =>
                _buildWorkshop(workshops[index]),
            openBuilder: (context, action) => WorkshopScreen(workshop: workshops[index],),
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
