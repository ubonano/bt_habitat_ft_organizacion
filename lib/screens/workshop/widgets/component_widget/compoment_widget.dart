import 'package:bt_habitat_ft_organizacion/screens/workshop/widgets/component_widget/component_enum.dart';
import 'package:flutter/material.dart';

import 'package:bt_habitat_ft_organizacion/models/component_model.dart';

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
            IconType.getIcon(component.type),
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
