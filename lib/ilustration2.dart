import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class Kruskal extends StatefulWidget {
  _KruskalState createState() => new _KruskalState();
}

class _KruskalState extends State<Kruskal> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = new Tween(begin: 0.0, end: 18.0).animate(controller)
      ..addListener(() {
        setState(() {
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
        new AssetImage('image/kruskal1.gif'),
        new AssetImage('image/kruskal2.gif'),
        new AssetImage('image/kruskal3.gif'),
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