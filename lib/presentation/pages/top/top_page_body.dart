// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:chat_functions_app/components/normal_button.dart';
import 'package:chat_functions_app/presentation/pages/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class TopPageBody extends ConsumerWidget {
  TopPageBody({Key? key}) : super(key: key);
  final smsCodeController = TextEditingController();
  final phoneController = TextEditingController();
  final _phoneKey = GlobalKey<FormState>();

  Future<String> phoneFunction(String phoneNumber, BuildContext context) {
    final completer = Completer<String>();
    final auth = FirebaseAuth.instance;

    auth.verifyPhoneNumber(
      phoneNumber: '+81${phoneController.text}',
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) async {
        UserCredential authresult = await auth.signInWithCredential(credential);

        User user = authresult.user!;
        // _getUserFromFirebase(user);
        completer.complete("signedUp");
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.toString());
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
              title: Text("認証コードを入力"),
              content: Text("SMSにて認証コードを送信しました🚀"),
              actions: [
                PinCodeTextField(
                  controller: smsCodeController,
                  autoFocus: true,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 300),
                  appContext: context,
                  onChanged: (String value) {},
                ),
                NormalButton(
                  title: '認証',
                  onTap: () => Navigator.pop(context, true),
                ),
              ],
            );
          },
        );
        if (result == true) {
          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCodeController.text);

          // Sign the user in (or link) with the credential
          await auth.signInWithCredential(credential).then(
                (value) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
              );
        }
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
            'Who..Chat?',
          ),
          const SizedBox(
            height: 48,
          ),
          Form(
            key: _phoneKey,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '電話番号を入力してください';
                  }
                  if (value.length != 11) {
                    return '形式が違います';
                  }
                  return null;
                },
                controller: phoneController,
                decoration: InputDecoration(
                  labelText: '電話番号',
                  labelStyle: const TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  floatingLabelStyle: const TextStyle(fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          NormalButton(
            title: '会員登録',
            onTap: () {
              if (_phoneKey.currentState!.validate()) {
                phoneFunction(phoneController.text, context);
              }
            },
          )
        ],
      ),
    );
  }
}
