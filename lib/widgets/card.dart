import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  final VoidCallback? onTap;
  const Card2({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage('assets/spice5.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            //end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 218, 213, 218).withOpacity(.4),
              const Color.fromARGB(255, 0, 0, 0).withOpacity(.2),
            ],
          ),
          color: const Color.fromARGB(255, 5, 5, 5),
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 194, 192, 192),
                offset: Offset(3.0, 3.0),
                //blurRadius: 15.0,
                spreadRadius: 1.0),
            BoxShadow(
                color: Color.fromARGB(221, 209, 206, 206),
                offset: Offset(-3.0, -3.0),
                //blurRadius: 15.0,
                spreadRadius: 1.0),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
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