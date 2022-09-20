import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class EmptyDataCart extends StatelessWidget {
  const EmptyDataCart({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      child: Center(
        child: Text(
          'No items in cart',
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
    );
  }
}
