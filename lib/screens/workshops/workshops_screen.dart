import 'package:bt_habitat_ft_organizacion/screens/workshops/widgets/add_workshop_fab/bloc/bloc/add_workshop_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshops_firebase_repository.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshops/bloc/workshops_bloc.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshops/widgets/add_workshop_fab/add_workshop_fab.dart';

class WorkshopsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final workshopsRepository = WorkshopsFirebaseRepository();

    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkshopsBloc>(
          create: (context) =>
              WorkshopsBloc(workshopsRepository: workshopsRepository)..init(),
        ),
        BlocProvider<AddWorkshopBloc>(
          create: (context) =>
              AddWorkshopBloc(workshopsRepository: workshopsRepository),
        ),
      ],
      child: _WorkshopsScaffold(),
    );
  }
}

class _WorkshopsScaffold extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Talleres"),
      ),
      body: BlocListener<AddWorkshopBloc, AddWorkshopState>(
        listener: _addWorkshopBlocListener,
        child: _Workshops(),
      ),
      floatingActionButton: AddWorkshopFAB(),
    );
  }

  void _addWorkshopBlocListener(BuildContext context, AddWorkshopState state) {
    if (state is AddWorkshopInProgress) {
      print('Listener: Creacion en proceso :O');
    } else if (state is AddWorkshopSuccess) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(state.message),
      ));
    } else if (state is AddWorkshopFailure) {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text(state.message),
      ));
    }
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
        } else {
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
