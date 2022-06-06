import 'package:flutter/material.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/layout/add_cart_layout.dart';
import 'package:update_yro/layout/image_spice_cart.dart';

class AddCartPage extends StatelessWidget {
  const AddCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOrange,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            ImageSpiceCart(),
            AddCart(),
          ],
        ),
      ),
    );
  }
}
