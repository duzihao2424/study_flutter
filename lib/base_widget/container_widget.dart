import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 300, height: 150),
      alignment: Alignment.center,
      child: Text(
        '测试Container Widget',
        style: TextStyle(color: Colors.white),
      ),
//      color: Colors.yellow,//如果定义了渐变色，那么就不能定义color属性
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.green,
        ),
        //边框
        boxShadow: [
          BoxShadow(
              color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4)
        ],
        //阴影
//          gradient: LinearGradient(
//              colors: [Colors.red, Colors.green, Colors.blue]),//线性渐变
        gradient: SweepGradient(
            colors: [Colors.red, Colors.green, Colors.blue]), //径向渐变
//        gradient:
//            RadialGradient(colors: [Colors.red, Colors.green, Colors.blue]),//圆环渐变
      ),
    );
  }
}
