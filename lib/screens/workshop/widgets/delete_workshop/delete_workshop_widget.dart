import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bt_habitat_ft_organizacion/repositories/workshop_firebase_repository.dart';
import 'package:bt_habitat_ft_organizacion/screens/workshop/widgets/delete_workshop/bloc/delete_workshop_bloc.dart';

class DeleteWorkshopWidget extends StatelessWidget {
  final String workshopId;

  const DeleteWorkshopWidget({Key key, @required this.workshopId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DeleteWorkshopBloc>(
      create: (context) =>
          DeleteWorkshopBloc(repository: WorkshopFirebaseRepository()),
      child: _DeleteWorkshop(
        workshopId: workshopId,
      ),
    );
  }
}

class _DeleteWorkshop extends StatelessWidget {
  final String workshopId;

  const _DeleteWorkshop({Key key, @required this.workshopId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteWorkshopBloc, DeleteWorkshopState>(
      listener: (context, state) async {
        if (state is DeleteWorkshopInProcess) {
          showCupertinoDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
              content: Row(
                children: <Widget>[
                  CircularProgressIndicator(),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Eliminando ....',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
          );
        } else if (state is DeleteWorkshopSuccess) {
          Navigator.pop(context);
          Navigator.pop(context);
        } else if (state is DeleteWorkshopFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('No se ha podido eliminar el taller'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: () => BlocProvider.of<DeleteWorkshopBloc>(context).add(
          DeleteWorkshopStarted(workshopId: workshopId),
        ),
      ),
    );
  }
}
