import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 50,
          itemExtent: 50,
//          physics: ClampingScrollPhysics(),//android滚动效果
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, position) =>
              listItem(title: position.toString())),
    );
  }

  Widget listItem({String title = "0"}) {
    return Container(
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.add),
            Text(title),
          ],
        ),
      ),
    );
  }
}
