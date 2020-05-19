import 'package:flutter/material.dart';

enum ComponentType {
  video,
  image,
  document,
}

class IconType {
  static Icon getIcon(String type) {
    switch (type) {
      case 'video':
        return Icon(Icons.videocam, color: Colors.red);
        break;

      case 'image':
        return Icon(Icons.image, color: Colors.purpleAccent);
        break;

      case 'document':
        return Icon(Icons.description, color: Colors.pinkAccent);
        break;

      default:
        return Icon(Icons.keyboard_return, color: Colors.blueGrey);
        break;
    }
  }
}
