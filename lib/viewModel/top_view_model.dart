import 'dart:async';

import 'package:chat_functions_app/components/normal_button.dart';
import 'package:chat_functions_app/data/service/firebase_service.dart';
import 'package:chat_functions_app/presentation/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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

// TODO:Refactor
final phoneNumberVerificationProvider =
    FutureProvider.family((ref, phone) async {
  final completer = Completer<String>();
  final auth = FirebaseAuth.instance;

  await auth.verifyPhoneNumber(
    phoneNumber: '+81$phone',
    timeout: const Duration(seconds: 30),
    verificationCompleted: (PhoneAuthCredential credential) async {
      // androidの処理を追加
    },
    verificationFailed: (FirebaseAuthException e) {
      // Firebase Error
      completer.complete(e.toString());
    },
    codeSent: (verificationId, resendToken) async {
      // ダイアログをを表示するためにbool値を変更
      ref.read(dialogStateProvider.notifier).update((state) => state = true);

      // dialogをawaitさせる
      // if (result == true) {
      //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
      //     verificationId: verificationId,
      //     smsCode: smsCodeController.text,
      //   );

      //   await auth.signInWithCredential(credential);
      // }
    },
    codeAutoRetrievalTimeout: (String verificationId) {
      completer.complete("timeout");
    },
  );

  return completer.future;
});

final dialogStateProvider = StateProvider<bool>((ref) => false);
