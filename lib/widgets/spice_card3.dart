import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/colors.dart';
import '../constants/enums_file.dart';

class SpiceCard3 extends StatefulWidget {
  const SpiceCard3({
    Key? key,
    required this.price,
    required this.spice,
    required this.imageurl,
    required this.quantity,
    this.callback,
    required this.color,
  }) : super(key: key);
  final String? price;
  final String? quantity;
  final String? spice;
  final String? imageurl;
  final Color? color;
  final VoidCallback? callback;

  @override
  State<SpiceCard3> createState() => _SpiceCard4State();
}

class _SpiceCard4State extends State<SpiceCard3> {
  // bool? _t;
  IconLikeType iconType = IconLikeType.unliked;

  void _toogleFormType() {
    setState(() {
      iconType = iconType == IconLikeType.unliked
          ? IconLikeType.liked
          : IconLikeType.unliked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final IconData _icon = iconType == IconLikeType.unliked
        ? Icons.favorite_border_outlined
        : Icons.favorite_rounded;
    return SafeArea(
      child: Container(
        height: 187,
        width: 154,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: widget.color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => _toogleFormType(),
                icon: Icon(
                  _icon,
                  color: kOrange,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, -1),
              child: SizedBox(
                width: 102,
                height: 100,
                child: Image.network(
                  widget.imageurl!,
                ),
                //Image.asset(imageurl!),
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
                        widget.spice!,
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
                        '${widget.price} per ${widget.quantity}grams',
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
                    onPressed: widget.callback,
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
