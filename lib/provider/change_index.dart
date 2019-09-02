import 'package:flutter/material.dart';

class ChangeIndex with ChangeNotifier {
  int index = 0;

  void setIndex(bottomBarNum) {
    index = bottomBarNum;
    notifyListeners();
  }
}
