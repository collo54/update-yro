import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:update_yro/constants/colors.dart';
import 'package:update_yro/layout/order_complete_layout.dart';

import '../services/auth_service.dart';

class OrderCompletePage extends StatelessWidget {
  const OrderCompletePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _signInout() async {
      //if (_validateAndSaveForm()) {}

      try {
        final auth = Provider.of<AuthService>(context, listen: false);
        final user = await auth.signOut();
        user;
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(
          color: kwhite,
          size: 36,
        ),
        leading: const Text(''),
        toolbarHeight: 70,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: TextButton(
              onPressed: _signInout,
              child: Text(
                'logout ',
                style: GoogleFonts.acme(
                  height: 1.3,
                  textStyle: const TextStyle(
                    color: kwhite,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
        ],
        // centerTitle: true,
        backgroundColor: kOrange,
      ),
      backgroundColor: kwhite,
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            OrderCompleteLayout(),
          ],
        ),
      ),
    );
  }
}
