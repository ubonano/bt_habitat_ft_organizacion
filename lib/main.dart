import 'package:bt_habitat_ft_organizacion/pages/worshops/workshop_provider.dart';
import 'package:bt_habitat_ft_organizacion/pages/worshops/workshops.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context){
        WorkshopProvider workshopProvider = WorkshopProvider();
        workshopProvider.listTitle();
        return workshopProvider;
      },
      child: MaterialApp(
        title: 'Habitat Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/home',
        routes: {
          '/home': (BuildContext context) => Workshops(),
        },
        home: Workshops(),
      ),
    );
  }
}
