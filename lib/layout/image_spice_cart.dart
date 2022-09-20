import 'package:flutter/material.dart';

class ImageSpiceLayout extends StatelessWidget {
  const ImageSpiceLayout({Key? key, required this.url}) : super(key: key);
  final String? url;

  List<Widget> pageChildren(double width) {
    return <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),
        decoration: const BoxDecoration(
          color: Color.fromARGB(0, 233, 162, 95),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        width: width,
        height: 226,
        child: Image.network(
          url!,
          width: 183,
          height: 176,
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
