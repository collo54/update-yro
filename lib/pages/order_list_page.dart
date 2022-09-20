import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/layout/order_list_layout.dart';

class OrderListPage extends StatelessWidget {
  const OrderListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: kwhite,
          size: 36,
        ),
        toolbarHeight: 70,
        title: Text(
          'My Cart',
          style: GoogleFonts.acme(
            height: 1.3,
            textStyle: const TextStyle(
              color: kwhite,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        centerTitle: true,
        backgroundColor: kOrange,
      ),
      backgroundColor: klightwhite,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            OrderListLayout(),
          ],
        ),
      ),
    );
  }
}
