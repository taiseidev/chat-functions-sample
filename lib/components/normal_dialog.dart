import 'package:flutter/material.dart';

class NormalDialog extends StatelessWidget {
  const NormalDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('誰かにチャット依頼を送信しますか？'),
      content: Text('相手が許可するとチャットルームが開かれます📩'),
      actions: <Widget>[
        GestureDetector(
          child: Text('やめる😢'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: Text('送信🚀'),
          onTap: () {},
        )
      ],
    );
  }
}
