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
            // LottieBuilder.network(
            //   'https://assets4.lottiefiles.com/packages/lf20_iyjr5y3a.json',
            //   height: 1500,
            //   // width: 1000,
            //   fit: BoxFit.cover,
            // ),
            TopBackGround(),
            TopPageBody(),
          ],
        ),
      ),
    );
  }
}

class TopBackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 150,
          left: 200,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.question_mark,
              size: 80,
              color: Color.fromARGB(255, 16, 62, 101),
            ),
          ),
        ),
        Positioned(
          top: 450,
          left: 200,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.question_mark,
              size: 80,
              color: Color.fromARGB(255, 16, 62, 101),
            ),
          ),
        ),
        Positioned(
          top: 250,
          left: 50,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 600,
          right: 200,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.question_mark,
              size: 80,
              color: Color.fromARGB(255, 16, 62, 101),
            ),
          ),
        ),
      ],
    );
  }
}
