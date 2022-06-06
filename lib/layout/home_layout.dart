import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/custom/data_search.dart';
import 'package:update_yro/pages/add_cart_page.dart';
import 'package:update_yro/widgets/spice_card.dart';

import '../widgets/spice_card2.dart';

class Homecontent extends StatelessWidget {
  const Homecontent({Key? key}) : super(key: key);

  List<Widget> pageChildren(double width, BuildContext context) {
    return <Widget>[
      Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: _buildTop(context),
        width: width,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return Row(
            children: pageChildren(constraints.biggest.width, context),
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

  Widget _buildTop(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      child: const Icon(Icons.menu),
                      onTap: () {},
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Welcome, jim',
                      style: GoogleFonts.acme(
                        height: 1.7,
                        textStyle: const TextStyle(
                          color: kwelcomejim,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
                Card(
                  shape: const CircleBorder(),
                  shadowColor: klabeltext,
                  elevation: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: const Icon(Icons.shopping_basket_rounded,
                          color: kOrange),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1),
                topRight: Radius.circular(1),
                bottomLeft: Radius.circular(1),
                bottomRight: Radius.circular(1),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: const Icon(Icons.search),
                  onTap: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'search for spices',
                  style: GoogleFonts.acme(
                    height: 1.3,
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 145, 146, 146),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: ktextfill,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            height: 40,
            child: ListView(
              // This next line does the trick.
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Chip(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                  label: Text(
                    'basil',
                    style: GoogleFonts.acme(
                      height: 1.14,
                      textStyle: const TextStyle(
                        color: kframe60,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Chip(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                  label: Text(
                    'curry',
                    style: GoogleFonts.acme(
                      height: 1.14,
                      textStyle: const TextStyle(
                        color: kframe60,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Chip(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                  label: Text(
                    'pepper',
                    style: GoogleFonts.acme(
                      height: 1.14,
                      textStyle: const TextStyle(
                        color: kframe60,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Chip(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                  label: Text(
                    'lavender',
                    style: GoogleFonts.acme(
                      height: 1.14,
                      textStyle: const TextStyle(
                        color: kframe60,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Chip(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                  label: Text(
                    'chives',
                    style: GoogleFonts.acme(
                      height: 1.14,
                      textStyle: const TextStyle(
                        color: kframe60,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Chip(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                  label: Text(
                    'cayanne pepper',
                    style: GoogleFonts.acme(
                      height: 1.14,
                      textStyle: const TextStyle(
                        color: kframe60,
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: kframe63,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(1),
                topRight: Radius.circular(1),
                bottomLeft: Radius.circular(1),
                bottomRight: Radius.circular(1),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recommended spices',
                  style: GoogleFonts.acme(
                    height: 1.6,
                    textStyle: const TextStyle(
                      color: kwelcomejim,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const SizedBox(
                  width: 60,
                  child: Divider(
                    height: 13,
                    thickness: 3,
                    indent: 0,
                    endIndent: 0,
                    color: kOrange,
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 3,
          ),
          child: Container(
            height: 190,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddCartPage()),
                    );
                  },
                  child: const Card(
                    elevation: 10,
                    child: SpiceCard1(
                      imageurl: 'assets/images/spice3.jpg',
                      price: '200 per kg',
                      spice: 'cayyene pepper',
                      color: kwhite,
                    ),
                    shadowColor: klabeltext,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Card(
                  elevation: 10,
                  child: SpiceCard1(
                    imageurl: 'assets/images/spice3.jpg',
                    price: '150 per kg',
                    spice: 'Basil leaves',
                    color: kwhite,
                  ),
                  shadowColor: klabeltext,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Card(
                  elevation: 10,
                  child: SpiceCard1(
                    imageurl: 'assets/images/spice3.jpg',
                    price: '200 per kg',
                    spice: 'curry',
                    color: kwhite,
                  ),
                  shadowColor: klabeltext,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Card(
                  elevation: 10,
                  child: SpiceCard1(
                    imageurl: 'assets/images/spice3.jpg',
                    price: '200 per kg',
                    spice: 'lavender',
                    color: kwhite,
                  ),
                  shadowColor: klabeltext,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Card(
                  elevation: 10,
                  child: SpiceCard1(
                    imageurl: 'assets/images/spice3.jpg',
                    price: '200 per kg',
                    spice: 'pepper',
                    color: kwhite,
                  ),
                  shadowColor: klabeltext,
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2, right: 2, top: 30),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hottest',
                  style: GoogleFonts.acme(
                    height: 1.9,
                    textStyle: const TextStyle(
                      color: kwelcomejim,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  'popular',
                  style: GoogleFonts.acme(
                    height: 1.9,
                    textStyle: const TextStyle(
                      color: kpopular,
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 3,
          ),
          child: Container(
            height: 153,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Card(
                  elevation: 10,
                  child: SpiceCard2(
                    imageurl: 'assets/images/spice3.jpg',
                    price: '200 per kg',
                    spice: 'curry',
                    color: klightcayyene,
                  ),
                  shadowColor: klabeltext,
                ),
                SizedBox(
                  width: 8,
                ),
                Card(
                  elevation: 10,
                  child: SpiceCard2(
                    imageurl: 'assets/images/spice3.jpg',
                    price: '100 per kg',
                    spice: 'lavender',
                    color: klightlavender,
                  ),
                  shadowColor: klabeltext,
                ),
                SizedBox(
                  width: 8,
                ),
                Card(
                  elevation: 10,
                  child: SpiceCard2(
                    imageurl: 'assets/images/spice3.jpg',
                    price: '150 per kg',
                    spice: 'pepper',
                    color: klightpersley,
                  ),
                  shadowColor: klabeltext,
                ),
              ],
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
