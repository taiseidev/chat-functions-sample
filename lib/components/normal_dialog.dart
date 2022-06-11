import 'package:chat_functions_app/components/positive_or_negative_button.dart';
import 'package:chat_functions_app/theme/positive_or_negative_button_style.dart';
import 'package:flutter/material.dart';

class NormalDialog extends StatelessWidget {
  const NormalDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('誰かにチャット依頼を送信しますか？'),
      content: Text('相手が許可するとチャットルームが開かれます📩'),
      actions: <Widget>[
        PositiveOrNegativeButton(
          title: 'やめる😢',
        ),
        PositiveOrNegativeButton(
          title: '送信🚀',
        ),
      ],
    );
  }
}
