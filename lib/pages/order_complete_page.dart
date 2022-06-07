import 'package:flutter/material.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/layout/order_complete_layout.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            OrderCompleteLayout(),
          ],
        ),
      ),
    );
  }
}
