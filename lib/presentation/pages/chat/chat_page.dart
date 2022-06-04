import 'package:chat_functions_app/presentation/pages/chat/chat_page_body.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatPageBody(),
    );
  }
}
