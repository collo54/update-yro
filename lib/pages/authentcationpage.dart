import 'package:flutter/material.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/layout/authentication_form_layout.dart';
import 'package:update_yro/layout/image_layout.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrange,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Imagecontent(),
            AuthenticationForm(),
          ],
        ),
      ),
    );
  }
}
