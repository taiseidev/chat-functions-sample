import 'package:chat_functions_app/firebase_options.dart';
import 'package:chat_functions_app/presentation/pages/top/top_page.dart';
import 'package:chat_functions_app/theme/normal_button_style.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthorizationStatus {
  authorized,
  denied,
  notDetermined,
  provisional,
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // FCMの通知権限リクエスト
  final messaging = FirebaseMessaging.instance;
  final result = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            fontSize: 40,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        extensions: const <ThemeExtension<dynamic>>[
          NormalButtonStyle(
            title: 'はじめる',
            borderRadius: 10,
            primaryColor: Colors.black,
          )
        ],
      ),
      home: const TopPage(),
    );
  }
}
