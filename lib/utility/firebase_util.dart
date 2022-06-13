import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtil {
  static Future<String> getCurrentUserUid() async {
    return FirebaseAuth.instance.currentUser!.uid;
  }
}
