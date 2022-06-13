import 'package:chat_functions_app/components/normal_button.dart';
import 'package:chat_functions_app/components/positive_or_negative_button.dart';
import 'package:chat_functions_app/theme/positive_or_negative_button_style.dart';
import 'package:chat_functions_app/viewModel/chat_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NormalDialog extends ConsumerWidget {
  const NormalDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text('誰かにチャット依頼を送信しますか？'),
      content: Text('相手が許可するとチャットルームが開かれます📩'),
      actions: <Widget>[
        NormalButton(
            title: '送信 🚀',
            onTap: () async {
              // ref.read(isSendedProvider.notifier).state = 1;
              await ref.read(sendMessageForSomeoneViewModelProvider.future);
              // await Future.delayed(const Duration(seconds: 3)).then(
              //     (value) => ref.read(isSendedProvider.notifier).state = 0);
            }),
        NormalButton(title: 'やめる 😢', onTap: () => Navigator.pop(context)),
      ],
    );
  }
}
