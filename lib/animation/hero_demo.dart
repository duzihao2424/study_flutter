import 'package:flutter/material.dart';

import 'hero_demo2.dart';

class HeroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1000,
      child: Hero(
          transitionOnUserGestures: true,
          tag: "hero1",
          child: Center(
              child: GestureDetector(
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.blue),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
            onTap: () {
              print("1111点击");
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HeroPage2()));
            },
          ))),
    );
  }

  void dd(){


  }
}
