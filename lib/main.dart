import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/workshop_firebase_repository.dart';
import 'screens/add_workshop/add_workshop_screen.dart';
import 'screens/login/login.dart';
import 'screens/workshop/widgets/delete_workshop/bloc/delete_workshop_bloc.dart';
import 'screens/workshops/widgets/list_workshops_widget/bloc/list_workshops_bloc.dart';
import 'screens/workshops/workshops_screen.dart';

import 'package:bt_habitat_ft_organizacion/screens/add_workshop/bloc/add_workshop_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _providers(),
      child: MaterialApp(
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
      ),
    );
  }

  List<BlocProvider> _providers() {

    return [
      BlocProvider<ListWorkshopsBloc>(
        create: (context) =>
            ListWorkshopsBloc(workshopRepository: WorkshopFirebaseRepository())
              ..init(),
      ),
      BlocProvider<DeleteWorkshopBloc>(
        create: (context) =>
            DeleteWorkshopBloc(repository: WorkshopFirebaseRepository()),
      ), 
      BlocProvider<AddWorkshopBloc>(
        create: (context) =>
            AddWorkshopBloc(workshopRepository: WorkshopFirebaseRepository()),
      ),
    ];
  }
}
