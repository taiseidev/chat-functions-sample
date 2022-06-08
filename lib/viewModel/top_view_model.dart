import 'package:chat_functions_app/service/firebase_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerUserProvider = FutureProvider<bool>((ref) async {
  try {
    final user = await FirebaseService.registerUser();
    final uid = user.user!.uid;
    await FirebaseService.registerUserDataToFirestore(uid);
    return true;
  } on FirebaseException catch (err) {
    print(err);
    return false;
  }
});