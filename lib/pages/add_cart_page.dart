import 'package:flutter/material.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/layout/add_cart_layout.dart';
import 'package:update_yro/layout/image_spice_cart.dart';

class AddCartPage extends StatelessWidget {
  const AddCartPage({
    Key? key,
    required this.urldownload,
    required this.spicename,
    required this.price,
    required this.description,
    required this.quantity,
  }) : super(key: key);
  final String? urldownload;
  final String? spicename;
  final double? price;
  final String? description;
  final double? quantity;

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
      backgroundColor: kOrange,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ImageSpiceLayout(
              url: urldownload,
            ),
            AddCart(
              url: urldownload,
              description: description,
              price: price,
              spicename: spicename,
              quantity: quantity,
            ),
          ],
        ),
      ),
    );
  }
}
