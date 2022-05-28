import 'package:flutter/material.dart';

class Imagecontent extends StatelessWidget {
  const Imagecontent({Key? key}) : super(key: key);

  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
        decoration: const BoxDecoration(
            color: Color.fromARGB(0, 233, 162, 95),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        width: width,
        height: 469,
        child: Center(
          child: Image.asset(
            'assets/images/spice3.jpg',
            width: 260,
            height: 301,
          ),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width),
          );
        }
      },
    );
  }
}
