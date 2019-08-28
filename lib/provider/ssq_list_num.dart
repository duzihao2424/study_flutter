import 'package:flutter/material.dart';

class ListNum with ChangeNotifier {
  List<int> ssqList = List();
  int count = 1;

  List<int> ssqBlueList = List();
  int blueCount = 1;

  void addItem(int item) {
    if (ssqList.length > 6) {
      print('ssqList长度最多为6');
    } else {
      ssqList.add(item);
      count++;
      print('ssqList添加之后长度=${ssqList.length}');
    }

    notifyListeners();
  }

  void removeItem(int item) {
    ssqList.remove(item);
    count--;
    print('ssqList移除之后长度=${ssqList.length}');
    notifyListeners();
  }

  void addBlueItem(int item) {
    if (ssqBlueList.length > 6) {
      print('ssqList长度最多为6');
    } else {
      ssqBlueList.add(item);
      blueCount++;
      print('ssqList添加之后长度=${ssqBlueList.length}');
    }

    notifyListeners();
  }

  void removeBlueItem(int item) {
    ssqBlueList.remove(item);
    blueCount--;
    print('ssqList移除之后长度=${ssqBlueList.length}');
    notifyListeners();
  }
}
