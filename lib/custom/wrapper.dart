import 'package:flutter/material.dart';
import 'package:update_yro/models/usermodel.dart';
import 'package:update_yro/pages/loginpage.dart';
import 'package:update_yro/pages/testpage.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key, required this.userSnapshot}) : super(key: key);
  final AsyncSnapshot<Userre?> userSnapshot;

  @override
  Widget build(BuildContext context) {
    if (userSnapshot.connectionState == ConnectionState.active) {
      return userSnapshot.hasData ? const HomePage() : const Loginpage();
    }
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
