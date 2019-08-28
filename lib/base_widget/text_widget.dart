import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;

  TextWidget({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          title,
          style: textStyle,
          overflow: TextOverflow.ellipsis, //结尾省略
        ),
      ),
    );
  }

  static const textStyle = TextStyle(
    color: Colors.green,
    //设置字体颜色
    fontSize: 30,
    //设置字体大小
    backgroundColor: Colors.yellow,
    decoration: TextDecoration.lineThrough,
    decorationStyle: TextDecorationStyle.double,
//      TextDecoration.underline：下划线
//        TextDecoration.overline：上划线
//    TextDecoration.lineThrough：中划线
//    TextDecoration.none：不划线
  );
}


class RichTextWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Center(
        child: RichText(
//          text: S,
        ),
      ),
    );
  }

}

