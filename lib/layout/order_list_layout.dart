// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/pages/delivery_details_page.dart';
import 'package:update_yro/widgets/order_item.dart';
import 'package:update_yro/widgets/order_item1.dart';

class OrderListLayout extends StatefulWidget {
  const OrderListLayout({Key? key}) : super(key: key);

  @override
  State<OrderListLayout> createState() => _OrderListLayoutState();
}

class _OrderListLayoutState extends State<OrderListLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width / 2, context),
          );
        } else {
          return Flex(
            direction: Axis.vertical,
            children: pageChildren(constraints.biggest.width, context),
          );
        }
      },
    );
  }

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Container(
        // color: Colors.white70,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        width: width, height: 680,
        child: _buildOrder(context),
      ),
      Container(
        color: klightwhite,
        width: width,
        height: 166,
        child: _buildCheckout(context),
      ),
    ];
  }

  _buildOrder(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //use orderitem1 instead!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        OrderItem1(
            price: '200 KES PER KG',
            spice: 'cayenne pepper',
            imageurl: 'assets/images/spice3.jpg',
            color: klightlavender,
            quantity: '4 KG'),
        OrderItem1(
          price: '150 KES PER KG',
          spice: ' pepper',
          imageurl: 'assets/images/spice3.jpg',
          color: klightlavender,
          quantity: '1 kg',
        ),
        OrderItem1(
          price: '150 KES PER KG',
          spice: ' lavender',
          imageurl: 'assets/images/spice3.jpg',
          color: klightcayyene,
          quantity: '3 kg',
        ),
      ],
    );
  }

  _buildCheckout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            children: [
              Text(
                'Total',
                style: GoogleFonts.acme(
                  height: 1.14,
                  textStyle: const TextStyle(
                    color: ktextorder,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Text(
                'KES 1150',
                style: GoogleFonts.acme(
                  height: 1.3,
                  textStyle: const TextStyle(
                    color: kwelcomejim,
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        MaterialButton(
          //minWidth: 132,
          color: kOrange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(9.0))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DeliveryDetailsPage()),
            );
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              'Checkout',
              style: GoogleFonts.acme(
                height: 1.5,
                textStyle: TextStyle(
                  color: kwhite,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
