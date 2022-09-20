import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_yro/constants/colors.dart';
import 'dart:math';

class OrderItem1 extends StatelessWidget {
  OrderItem1({
    Key? key,
    required this.price,
    required this.spice,
    required this.imageurl,
    // required this.color,
    this.callback,
    required this.quantity,
  }) : super(key: key);
  final String? price;
  final String? quantity;
  final String? spice;
  final String? imageurl;
  //final Color? color;
  final VoidCallback? callback;

  List<Color> c = [
    klightlavender,
    klightcayyene,
  ];

  Color randomListItem(List lst) => lst[Random().nextInt(c.length)];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 64,
            width: 65,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                imageurl!,
                width: 51.35,
                height: 32,
              ),
            ),
            decoration: BoxDecoration(
              color: randomListItem(c),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                fit: FlexFit.loose,
                child: Text(
                  spice!,
                  style: GoogleFonts.acme(
                    height: 1.5,
                    textStyle: const TextStyle(
                      color: ktextorder,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Text(
                quantity!,
                style: GoogleFonts.acme(
                  height: 1.5,
                  textStyle: const TextStyle(
                    color: ktextorder,
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              price!,
              style: GoogleFonts.acme(
                textStyle: const TextStyle(
                  color: kkesperkg,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Card(
            shape: const CircleBorder(),
            shadowColor: klabeltext,
            elevation: 10,
            child: CircleAvatar(
              backgroundColor: klightorange,
              child: IconButton(
                icon: const Icon(CupertinoIcons.minus, color: kOrange),
                onPressed: callback,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
