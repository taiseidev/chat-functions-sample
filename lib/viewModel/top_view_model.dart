import 'dart:async';

import 'package:chat_functions_app/data/service/firebase_service.dart';
import 'package:chat_functions_app/presentation/pages/home/home_page.dart';
import 'package:chat_functions_app/utility/firebase_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tuple/tuple.dart';

final phoneAuthProvider = StateNotifierProvider<PhoneAuthStateNotifier, bool>(
  (ref) => PhoneAuthStateNotifier(ref.read),
);

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
        state = true;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  // TODO:refactor
  Future<void> registerUser(String smsCode, BuildContext context) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    final deviceToken = await FirebaseUtil.getCurrentUserDeviceToken();
    final userTuple = Tuple3<PhoneAuthCredential, String, String>(
      credential,
      '',
      deviceToken!,
    );
    await read(registerUserProvider(userTuple));
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: ((context) => HomePage()),
      ),
    );
  }
}
