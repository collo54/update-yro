import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_yro/constants/colors.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key? key,
    required this.price,
    required this.spice,
    required this.imageurl,
    required this.color,
    required this.quantity,
  }) : super(key: key);
  final String? price;
  final String? quantity;
  final String? spice;
  final String? imageurl;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 64,
            width: 65,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                imageurl!,
                width: 51.35,
                height: 32,
              ),
            ),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
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
          Text(
            price!,
            style: GoogleFonts.acme(
              textStyle: const TextStyle(
                color: kkesperkg,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Card(
            shape: const CircleBorder(),
            shadowColor: klabeltext,
            elevation: 10,
            child: CircleAvatar(
              backgroundColor: klightorange,
              child: IconButton(
                icon: const Icon(CupertinoIcons.minus, color: kOrange),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
