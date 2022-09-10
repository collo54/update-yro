import 'package:flutter/material.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/layout/email_sign_in_form.dart';
import 'package:update_yro/layout/image_layout.dart';

class EmailSignInpage extends StatelessWidget {
  const EmailSignInpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrange,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Imagecontent(),
            EmailSignInForm(),
          ],
        ),
      ),
    );
  }
}
