// ignore_for_file: use_build_context_synchronously

import 'package:chat_functions_app/components/normal_button.dart';
import 'package:chat_functions_app/presentation/pages/home/home_page.dart';
import 'package:chat_functions_app/viewModel/top_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopPageBody extends ConsumerWidget {
  const TopPageBody({Key? key}) : super(key: key);

  Future<void> phoneFunction() async {
    final auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: '+81 090 9209 6513',
      verificationCompleted: (PhoneAuthCredential credential) {
        // androidのみ実装
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('invalid phone number');
        }
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = '0000';

        // Create a PhoneAuthCredential with the code
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );

        // Sign the user in (or link) with the credential
        await auth.signInWithCredential(credential);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print(verificationId);
      },
    );
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
            onPressed: () => phoneFunction(),
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
