import 'package:chat_functions_app/components/normal_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NormalDialog extends ConsumerWidget {
  const NormalDialog({
    Key? key,
    this.title,
    this.content,
    this.actions,
  }) : super(key: key);

  final String? title;
  final String? content;
  final Column? actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('誰かにチャット依頼を送信しますか？'),
      content: const Text('相手が許可するとチャットルームが開かれます📩'),
      actions: <Widget>[
        NormalButton(title: '送信 🚀', onTap: () async {}),
        NormalButton(title: 'やめる 😢', onTap: () => Navigator.pop(context)),
      ],
    );
  }
}
