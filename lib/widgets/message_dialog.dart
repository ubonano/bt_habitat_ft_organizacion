import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageDialog extends StatelessWidget {

  final message;

  const MessageDialog({Key key, @required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          SizedBox(
            width: 20,
          ),
          Text(
            '$message ...',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
