import 'package:flutter/material.dart';

/**
 * 关于控件的拖拽
 */

class DragPage extends StatefulWidget {
  @override
  _DragPageState createState() => _DragPageState();
}

class _DragPageState extends State<DragPage> {
  double _top = 0.0;
  double _left = 0.0;
  double _size = 100.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: FlutterLogo(
              size: _size,
            ),
//            onPanUpdate: (e) {
//              setState(() {
//                _top += e.delta.dy;
//                _left += e.delta.dx;
//              });
//            },

            onScaleUpdate: (e) {
              setState(() {
                _size = 300 * e.scale.clamp(0.5, 10.0);
                print(_size);
                print(_size);
              });
            },
          ),
        )
      ],
    );
  }
}
