import 'dart:async';

import 'package:chat_functions_app/config/enum/firebase_enum.dart';
import 'package:chat_functions_app/data/service/firebase_service.dart';
import 'package:chat_functions_app/state/top_page_state.dart';
import 'package:chat_functions_app/utility/firebase_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:roggle/roggle.dart';
import 'package:tuple/tuple.dart';

final phoneAuthProvider =
    StateNotifierProvider.autoDispose<PhoneAuthStateNotifier, TopPageState>(
  (ref) => PhoneAuthStateNotifier(ref.read),
);

class PhoneAuthStateNotifier extends StateNotifier<TopPageState> {
  final roggle = GetIt.I<Roggle>();

  PhoneAuthStateNotifier(this.read) : super(TopPageState());
  var read;

  final auth = FirebaseAuth.instance;
  String verificationId = '';

  Future<void> sendVerifyCode(String phone) async {
    state = state.copyWith(isLoading: true);
    await Future.delayed(const Duration(seconds: 2));
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+81$phone',
        timeout: const Duration(seconds: 30),
        verificationCompleted: (PhoneAuthCredential credential) async {
          // androidの処理を追加
        },
        verificationFailed: (FirebaseAuthException error) {
          roggle.wtf('FIREBASE ERROR:$error');
          final message = getErrorMessage(error);
          state = state.copyWith(
            isLoading: false,
            errorMessage: message,
          );
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId = verificationId;
          state = state.copyWith(
            isDisplayDialog: true,
            isLoading: false,
          );
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException {}
  }

  // TODO:refactor
  Future<void> registerUser(String smsCode, BuildContext context) async {
    state = state.copyWith(isDisplayDialog: false, isLoading: true);

    await Future.delayed(const Duration(seconds: 3));
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
    state = state.copyWith(
      isLoading: false,
      isRegister: true,
    );
  }

  // FirebaseExceptionからエラーメッセージを取得
  String getErrorMessage(FirebaseAuthException result) {
    String message = '';
    switch (result.code) {
      case 'too-many-requests':
        message = FirebaseAuthResultStatus.TooManyRequest.message;
        break;
      case 'operation-not-allowed':
        message = FirebaseAuthResultStatus.OperationNotAllowed.message;
        break;
      default:
        message = FirebaseAuthResultStatus.Undefined.message;
        break;
    }
    return message;
  }

  // エラーメッセージ表示後にリセット
  void resetErrorMessage() {
    state = state.copyWith(errorMessage: '');
  }

  void resetIsRegister() {
    state = state.copyWith(isRegister: false);
  }
}
