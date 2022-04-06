import 'package:division/division.dart';
import 'package:flutter/material.dart';

class DivisionWidget extends StatelessWidget {
  const DivisionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: Container(
        child: const Text('masala spice'),
      ),
      style: ParentStyle()
        ..alignment.center()
        ..padding(all: 6)
        ..background.color(Colors.green.shade800)
        ..borderRadius(all: 8),
    );
  }
}
