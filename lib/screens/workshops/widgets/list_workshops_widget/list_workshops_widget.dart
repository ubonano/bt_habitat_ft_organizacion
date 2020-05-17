import 'package:bt_habitat_ft_organizacion/widgets/message_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bt_habitat_ft_organizacion/models/workshop_model.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/workshop_screen.dart';
import 'bloc/list_workshops_bloc.dart';

class ListWorkshopsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListWorkshopsBloc, ListWorkshopsState>(
      builder: (context, state) {
        if (state is ListWorkshopsInitial || state is ListWorkshopsInProcess) {
          return MessageDialog(message: 'Cargando');
        } else if (state is ListWorkshopsSuccess) {
          return _buildWorkshops(state.workshops);
        }
      },
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
