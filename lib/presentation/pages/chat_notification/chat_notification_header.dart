import 'package:flutter/material.dart';

class ChatNotificationHeader extends StatelessWidget {
  const ChatNotificationHeader(this.type, {Key? key}) : super(key: key);
  final int type;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(type == 0 ? '受信一覧' : '送信一覧'),
    );
  }
}
