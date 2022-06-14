import 'package:chat_functions_app/presentation/pages/receive/receive_body.dart';
import 'package:chat_functions_app/presentation/pages/receive/receive_header.dart';
import 'package:flutter/material.dart';

class ReceivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(70, 70),
        child: ReceiveHeader(),
      ),
      body: ReceiveBody(),
    );
  }
}
