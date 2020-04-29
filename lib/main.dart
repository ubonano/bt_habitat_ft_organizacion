import 'package:bt_habitat_ft_organizacion/pages/detail_workshop_page.dart';
import 'package:bt_habitat_ft_organizacion/pages/login_page.dart';
import 'package:bt_habitat_ft_organizacion/pages/workshops_page.dart';
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
      initialRoute: '/login',
      routes: {
        '/login': (BuildContext context) => LoginPage(),
        '/workshops': (BuildContext context) => WorkShopsPage(),
        '/detail-workshop': (BuildContext context) => DetailWorkshopPage(),
      },
      home: LoginPage(),
    );
  }
}
