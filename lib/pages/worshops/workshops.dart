import 'package:bt_habitat_ft_organizacion/pages/worshops/workshop_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Workshops extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context){
        WorkshopProvider workshopProvider = WorkshopProvider();
        workshopProvider.listTitle();
        return workshopProvider;
      },
      child: Scaffold(
        body: Consumer<WorkshopProvider>(
          builder: (context, workshopProvider, _) => ListView(
            children: workshopProvider.list.map(loadListTile).toList(),
          ),
        ),
      ),
    );
  }

  ListTile loadListTile(e) => ListTile(
        title: Text(e),
      );
}
