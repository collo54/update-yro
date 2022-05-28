import 'package:flutter/material.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/layout/imageres.dart';
import 'package:update_yro/layout/loginform.dart';

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrange,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Imagecontent(),
            FinalstatefulForm(),
          ],
        ),
      ),
    );
  }
}
