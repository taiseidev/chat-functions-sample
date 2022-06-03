import 'package:chat_functions_app/service/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerUserProvider = ChangeNotifierProvider(
  (ref) => RegisterUserNotifier(ref),
);

class RegisterUserNotifier with ChangeNotifier {
  RegisterUserNotifier(this.ref);
  Ref ref;

  Future<void> registerUserData() async {
    try {
      final user = await FirebaseService.registerUser();
      final uid = user.user!.uid;
      await FirebaseService.registerUserDataToFirestore(uid);
    } on FirebaseException catch (err) {
      print(err);
    }
  }
}
