import 'package:flutter/material.dart';
import 'package:update_yro/layout/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 202, 184, 214),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            AddFirestoreData(),
          ],
        ),
      ),
    );
  }
}
