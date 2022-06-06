import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../pages/order_list_page.dart';

class AddCart extends StatefulWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        width: width, height: 498,
        child: _buildcart(context),
      ),
    ];
  }

  _buildcart(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              'CUMIN',
              style: GoogleFonts.acme(
                height: 1.3,
                textStyle: const TextStyle(
                  color: kwelcomejim,
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      shape: const CircleBorder(),
                      shadowColor: klabeltext,
                      elevation: 10,
                      child: CircleAvatar(
                        backgroundColor: klightorange,
                        child: IconButton(
                          icon:
                              const Icon(CupertinoIcons.minus, color: kOrange),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(
                      '1',
                      style: GoogleFonts.acme(
                        height: 1.3,
                        textStyle: const TextStyle(
                          color: kwelcomejim,
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Card(
                      shape: const CircleBorder(),
                      shadowColor: klabeltext,
                      elevation: 10,
                      child: CircleAvatar(
                        backgroundColor: klightorange,
                        child: IconButton(
                          icon: const Icon(Icons.add, color: kOrange),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'kes 200',
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
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: const Divider(
              thickness: 1,
            ),
          ),
        ),
        const SizedBox(height: 200),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'People across the world use cumin as a spice.It packs alot of benefits into the tiny seeds',
            style: GoogleFonts.acme(
              height: 1.7,
              textStyle: const TextStyle(
                color: kwelcomejim,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              shape: const CircleBorder(),
              shadowColor: klabeltext,
              elevation: 10,
              child: CircleAvatar(
                radius: 24,
                backgroundColor: klightorange,
                child: IconButton(
                  iconSize: 32,
                  icon: const Icon(Icons.favorite_outline, color: kOrange),
                  onPressed: () {},
                ),
              ),
            ),
            MaterialButton(
              minWidth: 200,
              color: kOrange,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(9.0))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OrderListPage()),
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
