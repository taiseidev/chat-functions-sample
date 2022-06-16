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
          alignment: Alignment.center,
          children: [
            LottieBuilder.network(
              'https://assets4.lottiefiles.com/packages/lf20_iyjr5y3a.json',
              height: 1500,
              // width: 1000,
              fit: BoxFit.cover,
            ),
            TopPageBody(),
          ],
        ),
      ),
    );
  }
}
