import 'package:flutter/material.dart';

import 'package:bt_habitat_ft_organizacion/models/component.dart';

import 'component_type.dart';

class ComponentWidget extends StatelessWidget {
  final Component component;

  const ComponentWidget({Key key, @required this.component}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Icon(Icons.delete),
                Icon(Icons.unarchive),
              ],
            )
          ],
        ));
  }
}
