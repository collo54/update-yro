import 'package:division/division.dart';
import 'package:flutter/material.dart';

class DivisionWidget extends StatefulWidget {
  const DivisionWidget({Key? key}) : super(key: key);

  @override
  _DivisionWidgetState createState() => _DivisionWidgetState();
}

class _DivisionWidgetState extends State<DivisionWidget> {
  bool isBeingTapped = false;

  @override
  Widget build(BuildContext context) {
    return Parent(
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Txt(
          'chicken masala',
          style: TxtStyle()
            ..textColor(Colors.white)
            ..fontSize(30)
            ..bold()
            ..italic()
            ..textAlign.start(),
        ),
      ),
      style: ParentStyle(angleFormat: AngleFormat.degree)
        ..alignment.center()
        ..padding(all: 16)
        ..width(350)
        ..height(150)
        ..background.image(
            url: 'assets/spice5.jpg',
            fit: BoxFit.cover) //color(Colors.green.shade800)
        ..borderRadius(all: 8)
        ..ripple(true)
        ..animate(100 /*milliseconds*/, Curves.decelerate)
        ..elevation(isBeingTapped ? 10 : 3)
        ..scale(isBeingTapped ? 1.1 : 1),
      gesture: Gestures()
        ..onTapDown((_) {
          setState(() {
            isBeingTapped = true;
          });
        })
        ..onTapUp((_) {
          setState(() {
            isBeingTapped = false;
          });
        })
        ..onTapCancel(() {
          setState(() {
            isBeingTapped = false;
          });
        }),
    );
  }
}
