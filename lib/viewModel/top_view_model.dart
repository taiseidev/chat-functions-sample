import 'dart:async';

import 'package:chat_functions_app/data/service/firebase_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerUserProvider = FutureProvider<bool>((ref) async {
  try {
    final user = await FirebaseService.registerUser();
    final uid = user.user!.uid;
    await FirebaseService.registerUserDataToFirestore(uid);
    return true;
  } on FirebaseException catch (err) {
    if (kDebugMode) {
      print(err);
    }
    return false;
  }
});

final phoneAuthProvider = StateNotifierProvider<PhoneAuthStateNotifier, bool>(
    (ref) => PhoneAuthStateNotifier(ref.read));

class PhoneAuthStateNotifier extends StateNotifier<bool> {
  PhoneAuthStateNotifier(this.read) : super(false);
  var read;
  final auth = FirebaseAuth.instance;
  String verificationId = '';

  Future<void> sendVerifyCode(String phone) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+81$phone',
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) async {
        // androidの処理を追加
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (verificationId, resendToken) {
        this.verificationId = verificationId;
        // ダイアログをを表示するためにbool値を変更
        state = true;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> registerUser(String smsCode) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );

    await auth.signInWithCredential(credential);
  }
}
