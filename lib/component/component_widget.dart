import 'package:bt_habitat_ft_organizacion/component/bloc/component_bloc.dart';
import 'package:flutter/material.dart';

import 'package:bt_habitat_ft_organizacion/component/model/component.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'component_type.dart';

class ComponentWidget extends StatelessWidget {
  final Component component;
  final String workshopId;
  final String momentId;

  const ComponentWidget(
      {Key key,
      @required this.component,
      @required this.workshopId,
      @required this.momentId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ComponentBloc>(
      create: (context) => ComponentBloc(workshopId, momentId),
      child: Container(
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(10),
          color: Colors.white,
          child: Row(
            children: <Widget>[
              ComponentType.getIconByType(component.type),
              SizedBox(
                width: 10,
              ),
              Text('${component.title}'),
              Expanded(
                child: Container(),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () => BlocProvider.of<ComponentBloc>(context).add(DeleteComponentStarted(component.id)))
                ],
              )
            ],
          )),
    );
  }
}
