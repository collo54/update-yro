import 'package:flutter/material.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/layout/image_layout.dart';
import 'package:update_yro/layout/sms_verification_form.dart';

class AddSmsVerificationPage extends StatelessWidget {
  const AddSmsVerificationPage({Key? key, required this.phoneno})
      : super(key: key);
  final String phoneno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrange,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Imagecontent(),
            SmsVerificationForm(phone: phoneno),
          ],
        ),
      ),
    );
  }
}
