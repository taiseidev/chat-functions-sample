import 'package:chat_functions_app/presentation/pages/top/top_page_background.dart';
import 'package:chat_functions_app/presentation/pages/top/top_page_body.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TopPage extends StatelessWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FCMNotificationListener(
      onNotification: (RemoteMessage notification, void Function() setState) {},
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            TopPageBackGround(),
            TopPageBody(),
          ],
        ),
      ),
    );
  }
}
