import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/repositories/workshops_firebase_repository.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshops/bloc/workshops_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkshopsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    // ignore: close_sinks
    final workshopsBloc = BlocProvider.of<WorkshopsBloc>(context);

    return BlocBuilder<WorkshopsBloc, WorkshopsState>(
      builder: (context, state) {
        if (state is WorkshopsInitial || state is WorkshopsLoadInProgress)
          return Center(
            child: CircularProgressIndicator(),
          );
        else if (state is WorkshopsLoadSuccess) {
          return _buildWorkshops(context, state.workshops);
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
