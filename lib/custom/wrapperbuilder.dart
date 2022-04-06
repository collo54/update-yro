import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:update_yro/models/usermodel.dart';

import '../main.dart';

class WrapperBuilder extends ConsumerWidget {
  const WrapperBuilder({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<Userre?>) builder;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authenticate);

    return StreamBuilder<Userre?>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          final user = snapshot.data;
          if (user != null) {
            return builder(context, snapshot);
          }
          return builder(context, snapshot);
        });
  }
}
