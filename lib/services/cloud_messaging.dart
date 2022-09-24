import 'package:firebase_messaging/firebase_messaging.dart';

class CloudMessaging {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getToken(String vapidkey) async {
    final fcmToken = await _firebaseMessaging.getToken(vapidKey: vapidkey);
    return fcmToken;
  }
}
