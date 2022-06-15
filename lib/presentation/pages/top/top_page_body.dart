// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:chat_functions_app/components/normal_button.dart';
import 'package:chat_functions_app/presentation/pages/home/home_page.dart';
import 'package:chat_functions_app/viewModel/top_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class TopPageBody extends ConsumerWidget {
  TopPageBody({Key? key}) : super(key: key);
  final controller = TextEditingController();

  Future<String> phoneFunction(String phoneNumber, BuildContext context) {
    final completer = Completer<String>();
    final _firebaseAuth = FirebaseAuth.instance;

    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+81 90 9209 6513',
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) async {
        UserCredential authresult =
            await _firebaseAuth.signInWithCredential(credential);

        User user = authresult.user!;
        // _getUserFromFirebase(user);
        completer.complete("signedUp");
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.toString());
        print('エラー');
        String error = e.code == 'invalid-phone-number'
            ? "Invalid number. Enter again."
            : "Can Not Login Now. Please try again.";
        completer.complete(error);
      },
      codeSent: (verificationId, resendToken) async {
        final result = await showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) {
            return AlertDialog(
              title: Text("This is the title"),
              content: Text("This is the content"),
              actions: [
                PinCodeTextField(
                  controller: controller,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: Duration(milliseconds: 300),
                  onChanged: (value) {
                    controller.text = value;
                  },
                  appContext: context,
                ),
                ElevatedButton(
                  child: Text("OK"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            );
          },
        );
        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: controller.text);

        // Sign the user in (or link) with the credential
        await _firebaseAuth
            .signInWithCredential(credential)
            .then((value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                )));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        completer.complete("timeout");
      },
    );

    return completer.future;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Who...?',
          ),
          const SizedBox(
            height: 80,
          ),
          // TextFormField(
          //   controller: controller,
          //   keyboardType: TextInputType.phone,
          //   onChanged: (String value) {
          //     controller.text = value;
          //   },
          // ),
          ElevatedButton(
            onPressed: () => phoneFunction('09092096513', context),
            child: Text('送信'),
          ),
        ],
      ),
    );
  }
}



          // 匿名認証のボタン
          // NormalButton(
          //   title: 'はじめる',
          //   onTap: () async {
          //     final result = await ref.read(registerUserProvider.future);
          //     if (result) {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => const HomePage(),
          //         ),
          //       );
          //     }
          //   },
          // ),
