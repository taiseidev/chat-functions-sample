import 'package:chat_functions_app/presentation/pages/chat_notification/chat_notification_body.dart';
import 'package:chat_functions_app/presentation/pages/chat_notification/chat_notification_header.dart';
import 'package:flutter/material.dart';

class ChatNotificationPage extends StatelessWidget {
  ChatNotificationPage(this.type, {Key? key}) : super(key: key);
  int type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(70, 70),
        child: ChatNotificationHeader(type),
      ),
      body: ChatNotificationBody(type),
    );
  }
}
