import 'package:flutter/material.dart';

class CurveAnimation extends StatefulWidget {
  @override
  _CurveAnimationState createState() => _CurveAnimationState();
}

class _CurveAnimationState extends State<CurveAnimation>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  /**
   * Curves.easeIn  放大缩小
   */
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _animation
      ..addListener(() {
        print(_animation.value);
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimationLogo(
      animation: _animation,
    );
  }
}

class AnimationLogo extends AnimatedWidget {
  final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  final _sizeTween = Tween<double>(begin: 0.0, end: 300.0);

  AnimationLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final Animation<double> animation = listenable;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
