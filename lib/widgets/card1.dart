import 'package:flutter/material.dart';

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/spice5.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 22, 24, 24).withOpacity(.4),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(.2),
            ],
          ),
          color: const Color.fromARGB(255, 143, 125, 125),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 161, 158, 158),
                offset: Offset(3.0, 3.0),
                // blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Color.fromARGB(221, 228, 218, 218),
                offset: Offset(-3.0, -3.0),
                // blurRadius: 15.0,
                spreadRadius: 1.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "curry",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
