import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_app/provider/change_native_style.dart';

class ColorGridview extends StatelessWidget {
  final List<Color> cList = [
    Colors.red,
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.yellow,
    Colors.green
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (context, position) {
          return itemGrid(context, position);
        },
        itemCount: cList.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
      ),
    );
  }

  Widget itemGrid(context, position) {
    ChangeStyle c = Provider.of<ChangeStyle>(context);
    return InkWell(
      child: CircleAvatar(
        radius: 20,
        backgroundColor: cList[position],
      ),
      onTap: () {
        c.changeColor(cList[position]);
        Navigator.pop(context);
      },
    );
  }
}
