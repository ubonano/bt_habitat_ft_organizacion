import 'package:bt_habitat_ft_organizacion/screens/list_workshops/list_workshops_screen.dart';
import 'package:bt_habitat_ft_organizacion/screens/login/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habitat Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/workshops',
      routes: {
        '/workshops': (BuildContext context) => ListWorkshopsScreen(),
        '/login': (BuildContext context) => LoginScreen(),
      },
    );
  }
}
