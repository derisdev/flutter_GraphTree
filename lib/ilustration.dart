import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Prim extends StatefulWidget {
  _PrimState createState() => new _PrimState();
}

class _PrimState extends State<Prim> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    Widget carousel = new Carousel(
      boxFit: BoxFit.contain,
      images: [
        new AssetImage('image/prim1.gif'),
        new AssetImage('image/prim2.gif'),
        new AssetImage('image/prim3.gif'),
      ],
      animationCurve: Curves.easeIn,
      animationDuration: Duration(seconds: 100000),
    );

    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Center(
        child: new Container(
          padding: const EdgeInsets.all(20.0),
          height: screenHeight / 2,
          child: new ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: new Stack(
              children: [
                carousel
              ],
            ),
          ),
        ),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}