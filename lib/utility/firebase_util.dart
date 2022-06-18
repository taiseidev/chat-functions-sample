import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtil {
  static String getCurrentUserUid() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  static Future<String?> getCurrentUserDeviceToken() async {
    return await FirebaseMessaging.instance.getToken();
  }
}
