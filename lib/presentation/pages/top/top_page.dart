import 'package:chat_functions_app/presentation/pages/top/top_page_body.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:flutter/material.dart';

class TopPage extends StatelessWidget {
  TopPage({Key? key}) : super(key: key);
  final analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return FCMNotificationListener(
      onNotification: (RemoteMessage notification, void Function() setState) {},
      child: const Scaffold(
        body: TopPageBody(),
      ),
    );
  }
}
