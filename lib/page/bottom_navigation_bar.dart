import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_app/provider/change_index.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  int index;

  BottomNavigationBarWidget({Key key, this.index}) : super(key: key);

  List<BottomNavigationBarItem> bList = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text("首页")),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text("双色球")),
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.shopping_cart), title: Text("购物车")),
//    BottomNavigationBarItem(
//        icon: Icon(CupertinoIcons.profile_circled), title: Text("我的")),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: bList,
      currentIndex: index,
      onTap: (i) {
        Provider.of<ChangeIndex>(context).setIndex(i);
      },
    );
  }
}
