import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import 'package:study_flutter_app/page/ssq_item_widget.dart';
import 'package:study_flutter_app/provider/ssq_list_num.dart';

class ssqPage extends StatefulWidget {
  @override
  _ssqPageState createState() => _ssqPageState();
}

class _ssqPageState extends State<ssqPage> {
  Random _random = Random.secure();
  Set<int> _setBall = Set();
  List<int> _lball = List();
  int _blueNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    randomRedNum();
    _blueNum = randomBlueNum();
  }

  @override
  Widget build(BuildContext context) {
    ListNum listNum = Provider.of<ListNum>(context);
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 50,
              margin: const EdgeInsets.all(20),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, position) {
                  if (position > 5) {
                    return blueBall();
                  } else {
                    return redBall(position);
                  }
                },
                itemCount: _lball.length + 1,
                scrollDirection: Axis.horizontal,
              ),
            ),
            RaisedButton(
              onPressed: () {
                setState(() {
                  randomRedNum();
                  _blueNum = randomBlueNum();
                });
              },
              child: Text("点击重新生成"),
            ),
            Container(
              child: Text("请选择6个红球"),
              margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            ),
            Container(
              height: 350,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7, mainAxisSpacing: 20),
                itemBuilder: (context, position) {
                  return ssqItemWidget(
                    position: (position + 1),
                    color: Colors.red,
                    size: 6,
                  );
                },
                itemCount: 33,
              ),
            ),
            Container(
              child: Text("请选择1个蓝球"),
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7, mainAxisSpacing: 20),
                itemBuilder: (context, position) {
                  return ssqItemWidget(
                    position: (position + 1),
                    color: Colors.blue,
                    size: 1,
                  );
                },
                itemCount: 16,
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 65,
                  width: 300,
                  margin: const EdgeInsets.fromLTRB(20, 20, 0, 20),
                  child: ListView(
                    children: chooseRedBall(),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                listNum.ssqBlueList.length != 0
                    ? Container(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 25,
                          child: Text(
                            '${listNum.ssqBlueList[0]}',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      )
                    : Text(""),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget redBall(int position) {
    return Container(
      height: 50,
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 25,
        child: Text(
          '${_lball[position]}',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget blueBall() {
    return Container(
      height: 50,
      child: CircleAvatar(
        backgroundColor: Colors.blue,
        radius: 25,
        child: Text(
          '${_blueNum}',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  List<int> randomRedNum() {
    for (int i = 0; i < 6; i++) {
      int _num = _random.nextInt(34);
      if (_num != 0) {
        _setBall.add(_num);
      }
    }

    print('长度=${_setBall.length}');
    if (_setBall.length != 6) {
      _setBall.clear();
      randomRedNum();
    }

    _lball = _setBall.toList();
    _lball.sort();
    return _lball;
  }

  int randomBlueNum() {
    int _blueNum = _random.nextInt(16);
    if (_blueNum == 0) {
      _blueNum = 1;
    }
    return _blueNum;
  }

  List<Widget> chooseRedBall() {
    ListNum listNum = Provider.of<ListNum>(context);
    listNum.ssqList.sort();
    return listNum.ssqList.map((value) {
      return Container(
        height: 50,
        child: CircleAvatar(
          backgroundColor: Colors.red,
          radius: 25,
          child: Text(
            '${value}',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      );
    }).toList();
  }
}
