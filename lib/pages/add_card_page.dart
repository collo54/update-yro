import 'package:flutter/material.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/layout/add_card_layout.dart';

class AddCardPage extends StatelessWidget {
  const AddCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: kwhite,
          size: 36,
        ),
        backgroundColor: kOrange,
      ),
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            AddCardLayout(),
          ],
        ),
      ),
    );
  }
}
