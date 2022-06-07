import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_yro/pages/authentcationpage.dart';
import '../constants/colors.dart';
import '../pages/homepage.dart';

class OrderCompleteLayout extends StatelessWidget {
  const OrderCompleteLayout({Key? key}) : super(key: key);

//pushes a new route from welcome page to authentication page
  Future<void> _gotoAutheticationpage(BuildContext context) async {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AuthenticationPage()),
      );
    } catch (e) {
      print(e);
    }
  }

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
        width: width,
        child: _buildMessage(context),
      ),
    ];
  }

  Widget _buildMessage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            shape: const CircleBorder(),
            shadowColor: klabeltext,
            elevation: 0,
            child: CircleAvatar(
              radius: 82,
              backgroundColor: klightgreen,
              child: CircleAvatar(
                radius: 54,
                backgroundColor: kgreen,
                child: IconButton(
                  iconSize: 55,
                  alignment: Alignment.center,
                  icon: const Icon(Icons.check, color: kwhite),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Order Taken',
            style: GoogleFonts.acme(
              height: 1.5,
              textStyle: const TextStyle(
                color: kwelcomejim,
                fontSize: 32,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Your order has been taken and is being attended to',
            style: GoogleFonts.acme(
              height: 1.5,
              textStyle: const TextStyle(
                color: kpurplelight,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: _buildButton(context),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }

  _buildButton(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MaterialButton(
          minWidth: 200,
          color: kOrange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          onPressed: () {},
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              "Track order",
              style: GoogleFonts.acme(
                textStyle: const TextStyle(
                  color: kPrimaryLight,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        MaterialButton(
          minWidth: 200,
          color: klightorange,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 18.0, horizontal: 25.0),
            child: Text(
              "continue shopping",
              style: GoogleFonts.acme(
                textStyle: const TextStyle(
                  color: kOrange,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
