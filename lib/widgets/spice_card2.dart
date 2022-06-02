import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_yro/constants/colors.dart';

class SpiceCard2 extends StatelessWidget {
  const SpiceCard2({
    Key? key,
    required this.price,
    required this.spice,
    required this.imageurl,
    required this.color,
  }) : super(key: key);
  final String? price;
  final String? spice;
  final String? imageurl;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 150,
        width: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border_outlined,
                  color: kOrange,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, -1),
              child: SizedBox(
                width: 88,
                height: 63,
                child: Image.asset(imageurl!),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        spice!,
                        style: GoogleFonts.acme(
                          height: 1.3,
                          textStyle: const TextStyle(
                            color: kwelcomejim,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      Text(
                        price!,
                        style: GoogleFonts.acme(
                          // height: 1.14,
                          textStyle: const TextStyle(
                            color: kkesperkg,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    splashColor: klabeltext,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: kOrange,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
