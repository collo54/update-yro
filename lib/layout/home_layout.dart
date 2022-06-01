import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/custom/data_search.dart';

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
              mainAxisAlignment: MainAxisAlignment.start,
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
                const SizedBox(
                  width: 100,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.shopping_basket_rounded,
                    color: kOrange,
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
      ],
    );
  }
}
