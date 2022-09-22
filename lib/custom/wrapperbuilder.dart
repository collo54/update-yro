import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/usermodel.dart';
import '../services/auth_service.dart';
import '../services/database_service.dart';
import 'environment.dart';

class WrapperBuilder extends StatelessWidget {
  const WrapperBuilder({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<Userre?>) builder;
  @override
  Widget build(BuildContext context) {
    final AuthService? auth = Provider.of<AuthService>(context, listen: true);
    //AuthService _auth2 = AuthService();

    return StreamBuilder<Userre?>(
        stream: auth!.onAuthStateChanged,
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (user != null) {
            return MultiProvider(
              providers: [
                Provider<Userre>.value(value: user),
                Provider<Databaseservice>(
                  create: (_) => Databaseservice(uid: user.uid!),
                ),
                Provider<EnvironmentConfig>(
                  create: (_) => EnvironmentConfig(),
                ),
                /*Provider<ImagePickerService>(
                  create: (_) => ImagePickerService(),
                ),
                Provider<FirebaseStorageService>(
                  create: (_) => FirebaseStorageService(uid: user.uid!),
                ),
                */
              ],
              child: builder(context, snapshot), //HomePage(),
            );
          }
          return builder(context, snapshot); //LandingPage();
        });
  }
}
