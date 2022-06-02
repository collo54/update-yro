import 'package:flutter/material.dart';
import 'package:update_yro/pages/addspice.dart';
import 'package:update_yro/widgets/spice_card2.dart';
import 'package:update_yro/widgets/spice_card.dart';
import '../widgets/divisionwidget.dart';

class AddFirestoreData extends StatelessWidget {
  const AddFirestoreData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return const DesktopNavbar();
        } else {
          return const MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  const DesktopNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(),
        ),
        MaterialButton(
          color: Colors.indigo[100],
          shape: const CircleBorder(side: BorderSide.none),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.all(25),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class MobileNavbar extends StatelessWidget {
  const MobileNavbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          child: DivisionWidget(), //Card1(),
        ),
        Positioned(
          top: -4,
          right: -4,
          child: MaterialButton(
            color: Colors.indigo[100],
            shape: const CircleBorder(side: BorderSide.none),
            onPressed: () => AddContributionsPage.show(context),
            child: const Padding(
              padding: EdgeInsets.all(25),
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
