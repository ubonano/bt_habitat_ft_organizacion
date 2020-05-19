import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bt_habitat_ft_organizacion/screens/workshop/widgets/delete_workshop/bloc/delete_workshop_bloc.dart';

class DeleteWorkshopWidget extends StatelessWidget {
  final String workshopId;

  const DeleteWorkshopWidget({Key key, @required this.workshopId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeleteWorkshopBloc, DeleteWorkshopState>(
      builder: (context, state) {
        return IconButton(
          icon: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          onPressed: () => BlocProvider.of<DeleteWorkshopBloc>(context).add(
            DeleteWorkshopStarted(workshopId: workshopId),
          ),
        );
      },
    );
  }
}
