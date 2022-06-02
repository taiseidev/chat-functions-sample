import 'package:chat_functions_app/screen/chat_screen.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  const ChatList({Key? key}) : super(key: key);
  Future<void> _refresh() {
    return Future.delayed(
      const Duration(seconds: 3),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _refresh(),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: ((context, index) => InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChatPage()),
                ),
                child: const Card(
                  child: ListTile(
                    title: Text('チャットリスト'),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
