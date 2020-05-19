import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageDialog {

  final BuildContext context;
  final String message;

  MessageDialog({@required this.context, @required this.message});

  void show(){
    showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
            title: Row(
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  width: 20,
                ),
                Text('$message ....'),
              ],
            ),
          )
        ,
      );
  }

  void hide(){
    Navigator.pop(context);
  }


}
