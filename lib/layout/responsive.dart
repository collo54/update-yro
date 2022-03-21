import 'package:flutter/material.dart';
import 'package:update_yro/widgets/card.dart';

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
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: TopUpCard(),
        ),
        MaterialButton(
          color: Colors.indigo[100],
          shape: const CircleBorder(side: BorderSide.none),
          onPressed: () {}, //_createContributor(context),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const TopUpCard(),
        MaterialButton(
          color: Colors.indigo[100],
          shape: const CircleBorder(side: BorderSide.none),
          onPressed: () {},
          //_createContributor(context),
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
