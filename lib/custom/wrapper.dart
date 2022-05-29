import 'package:flutter/material.dart';
import 'package:update_yro/models/usermodel.dart';
import 'package:update_yro/pages/homepage.dart';

import '../pages/welcome_page.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key, required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<Userre?> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? const HomePage() : const WelcomePage();
    }
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
