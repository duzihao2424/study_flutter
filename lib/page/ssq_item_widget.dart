import 'package:flutter/material.dart';
import 'package:study_flutter_app/provider/ssq_list_num.dart';
import 'package:provider/provider.dart';

class ssqItemWidget extends StatefulWidget {
  int position = 0;
  var color;
  int size;

  ssqItemWidget({Key key, this.position, this.color, this.size})
      : super(key: key);

  @override
  _ssqItemWidgetState createState() => _ssqItemWidgetState();
}

class _ssqItemWidgetState extends State<ssqItemWidget> {
  var defaultColor = Colors.white;
  var textColor;
  bool redIsCheck = false, blueIsCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: item(context),
    );
  }

  Widget item(context) {
    ListNum listNum = Provider.of<ListNum>(context);
    return InkWell(
      onTap: () {
        setState(() {
          if (widget.color == Colors.red) {
            if (redIsCheck) {
              redIsCheck = false;
              defaultColor = Colors.white;
              textColor = widget.color;
              listNum.removeItem(widget.position);
            } else {
              print('red${listNum.count}');
              if (listNum.count <= widget.size) {
                redIsCheck = true;
                defaultColor = widget.color;
                textColor = Colors.dzhWhite;
                listNum.addItem(widget.position);
              }
            }
          } else {
            if (blueIsCheck) {
              blueIsCheck = false;
              defaultColor = Colors.white;
              textColor = widget.color;
              listNum.removeBlueItem(widget.position);
            } else {
              print('blue${listNum.blueCount}');
              if (listNum.blueCount <= widget.size) {
                blueIsCheck = true;
                defaultColor = widget.color;
                textColor = Colors.dzhWhite;
                listNum.addBlueItem(widget.position);
              }
            }
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: widget.color, width: 1),
          color: defaultColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            '${widget.position}',
            style: TextStyle(color: textColor==null?widget.color:textColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
