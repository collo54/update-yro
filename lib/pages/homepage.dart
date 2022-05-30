import 'package:flutter/material.dart';
import 'package:update_yro/layout/home_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 255),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Homecontent(),
          ],
        ),
      ),
    );
  }
}
