import 'package:chat_functions_app/components/normal_button.dart';
import 'package:chat_functions_app/components/normal_dialog.dart';
import 'package:chat_functions_app/viewModel/top_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:roggle/roggle.dart';

class TopPageBody extends ConsumerWidget {
  TopPageBody({Key? key}) : super(key: key);
  final smsCodeController = TextEditingController();
  final phoneController = TextEditingController();
  final _phoneKey = GlobalKey<FormState>();

  final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(
      color: Colors.black,
    ),
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      phoneAuthProvider,
      (previous, next) async {
        if (next == true) {
          // ダイアログを発火
          final result = await showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return NormalDialog(
                  title: '認証コードを入力',
                  content: 'SMSにて認証コードを送信しました🚀',
                  actions: Column(children: [
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
                  ]));
            },
          );

          if (result) {
            await ref
                .read(phoneAuthProvider.notifier)
                .registerUser(smsCodeController.text, context);
          }
        }
      },
    );
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Who..Chat?',
              style: TextStyle(
                color: Color.fromARGB(255, 16, 62, 101),
              ),
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
                    floatingLabelStyle: const TextStyle(fontSize: 12),
                    focusedBorder: border,
                    enabledBorder: border,
                    errorBorder: border,
                    focusedErrorBorder: border,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            NormalButton(
              title: '会員登録',
              onTap: () async {
                if (_phoneKey.currentState!.validate()) {
                  await ref
                      .read(phoneAuthProvider.notifier)
                      .sendVerifyCode(phoneController.text);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
