import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:study_flutter_app/provider/change_index.dart';

class HeroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChangeIndex c = Provider.of<ChangeIndex>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("标题"),
      ),
      body: Container(
        width: double.infinity,
        height: 500,
        child: Column(
          children: <Widget>[
            Hero(
              tag: "hero1",
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
              transitionOnUserGestures: true,
            ),
            RaisedButton(
              onPressed: () {
                c.setIndex(1);
                Navigator.pop(context);
              },
              child: Text('back'),
            )
          ],
        ),
      ),
    );
  }
}
