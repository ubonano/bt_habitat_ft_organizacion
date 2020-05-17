import 'package:flutter/material.dart';

import 'screens/add_workshop/add_workshop_screen.dart';
import 'screens/login/login.dart';
import 'screens/workshops/workshops_screen.dart';

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
        '/workshops': (BuildContext context) => WorkshopsScreen(),
        '/login': (BuildContext context) => LoginScreen(),
        '/addworkshop': (BuildContext context) => AddWorkshopScreen(),
      },
    );
  }
}
