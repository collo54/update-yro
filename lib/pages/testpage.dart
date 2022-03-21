import 'package:flutter/material.dart';
import 'package:update_yro/layout/responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
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
