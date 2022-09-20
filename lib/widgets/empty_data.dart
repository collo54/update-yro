import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';

class EmptyData2 extends StatelessWidget {
  const EmptyData2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      child: Center(
        child: Text(
          'Out  of  Stock',
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
