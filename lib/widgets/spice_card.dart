import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:update_yro/constants/colors.dart';

import '../constants/enums_file.dart';

class SpiceCard1 extends StatelessWidget {
  SpiceCard1({
    Key? key,
    this.iconType,
    required this.price,
    required this.spice,
    required this.imageurl,
    required this.quantity,
    required this.color,
    this.f,
  }) : super(key: key);
  final String? price;
  final String? quantity;
  final String? spice;
  final String? imageurl;
  final Color? color;
  bool? f;
  IconLikeType? iconType; // = IconLikeType.unliked;

  IconData icontype(bool? t) {
    if (t == true) {
      IconData ionlike = Icons.favorite_rounded;
      return ionlike;
    }
    IconData ionUnlike = Icons.favorite_border_outlined;
    return ionUnlike;
  }

  @override
  Widget build(BuildContext context) {
    final IconData icon = iconType == IconLikeType.unliked
        ? Icons.favorite_border_outlined
        : Icons.favorite_rounded;
    return SafeArea(
      child: Container(
        height: 187,
        width: 152,
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
                onPressed: () {
                  if (f == true) {
                    f = false;
                  } else {
                    f = true;
                  }
                },
                icon: Icon(
                  icontype(f),
                  // icon,
                  color: kOrange,
                ),
              ),
            ),
            Align(
              alignment: const Alignment(0.0, -1),
              child: SizedBox(
                width: 100,
                height: 100,
                child: Image.network(
                  imageurl!,
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
                        '$price per $quantity',
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

class SpiceCard4 extends StatefulWidget {
  const SpiceCard4({
    Key? key,
    required this.price,
    required this.spice,
    required this.imageurl,
    required this.quantity,
    required this.color,
  }) : super(key: key);
  final String? price;
  final String? quantity;
  final String? spice;
  final String? imageurl;
  final Color? color;

  @override
  State<SpiceCard4> createState() => _SpiceCard4State();
}

class _SpiceCard4State extends State<SpiceCard4> {
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
        width: 152,
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
                width: 100,
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
                        '${widget.price} per ${widget.quantity}',
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
