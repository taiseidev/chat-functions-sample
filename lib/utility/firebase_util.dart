import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtil {
  static String getCurrentUserUid() {
    return FirebaseAuth.instance.currentUser!.uid;
  }
}
