import 'package:flutter/material.dart';

class ChangeStyle with ChangeNotifier {
  var default_color = Colors.red;

  void changeColor(color) {
    default_color = color;
    notifyListeners();
  }
}
