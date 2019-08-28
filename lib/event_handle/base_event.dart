import 'package:flutter/material.dart';

class BaseEvent extends StatefulWidget {
  @override
  _BaseEventState createState() => _BaseEventState();
}

class _BaseEventState extends State<BaseEvent> {
  String _event = "未检测到操作";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Listener(
        child: Center(
          child: Text(_event),
        ),
        onPointerDown: (PointerDownEvent event) {
          print(event.position);
          return showText('手指按下回调');
        },
        onPointerMove: (event) {
          print('两次指针移动事件的距离${event.delta}');
          return showText('手指移动回调');
        },
        onPointerUp: (event) {
          print('指针移动的方向${event.orientation}');
          return showText('手指抬起回调');
        },
      ),
    );
  }

  void showText(String text) {
    setState(() {
      _event = text;
    });
  }
}

/*
总结：
GestureDetector包裹IgnorePointer与AbsorbPointer的不同


当GestureDetector包裹IgnorePointer，
如果ignoring = true 那么GestureDetector与IgnorePointer的点击事件都将会被忽略
如果ignoring = false 那么事件将会向子widget传递，父widget的点击事件将不执行

当GestureDetector包裹AbsorbPointer，
如果absorbing = true 点击事件将不会向子widget传递，只在GestureDetecto 点击事件中执行
如果absorbing = false 点击事件将会向子widget传递，父widget的点击事件将不执行

 */
class EventLose extends StatefulWidget {
  @override
  _EventLoseState createState() => _EventLoseState();
}

class _EventLoseState extends State<EventLose> {
  bool _ignore = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Switch(
                value: _ignore,
                onChanged: (istrue) {
                  setState(() {
                    _ignore = istrue;
                  });
                }),

            GestureDetector(
              onTap: () {
                print("GestureDetector IgnorePointer点击事件");
              },
              child: IgnorePointer(
                ignoring: _ignore,
                child: RaisedButton(
                  onPressed: () {
                    print("IgnorePointer  RaisedButton点击事件");
                  },
                  child: Text("IgnorePointer click"),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print("GestureDetector AbsorbPointer点击事件");
              },
              child: AbsorbPointer(
                absorbing: _ignore,
                child: RaisedButton(
                  onPressed: () {
                    print("AbsorbPointer  RaisedButton点击事件");
                  },
                  child: Text("AbsorbPointer click"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
