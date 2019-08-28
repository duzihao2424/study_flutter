import 'package:flutter/material.dart';

class directionPage extends StatefulWidget {
  @override
  _directionPageState createState() => _directionPageState();
}

class _directionPageState extends State<directionPage> {
  double _top = 0, _left = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: FlutterLogo(
                size: 100,
              ),
              onVerticalDragUpdate: (e) {
                setState(() {
                  _top = e.delta.dy;
                  print("垂直${_top}");
                });
              },
              onHorizontalDragUpdate: (e) {
                setState(() {
                  _left = e.delta.dx;
                  print("水平${_left}");
                });
              },
              onTapDown: (e) {
                print("按下");
              },
              onTapUp: (e) {
                print("抬起");
              },
              onVerticalDragEnd: (e) {
                print("结束垂直");
              },
              onHorizontalDragEnd: (e) {
                print("结束水平");
              },
            ),
          ),
        ],
      ),
    );
  }
}
