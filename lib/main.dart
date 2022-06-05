import 'package:chat_functions_app/firebase_options.dart';
import 'package:chat_functions_app/presentation/pages/top/top_page.dart';
import 'package:chat_functions_app/theme/normal_button_style.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FCMConfig.instance.init(
    onBackgroundMessage: _fcmBackgroundHandler,
    defaultAndroidChannel: const AndroidNotificationChannel(
      'fcm_channel',
      'Fcm config',
      importance: Importance.high,
    ),
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
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
      home: FCMNotificationListener(
          onNotification:
              (RemoteMessage notification, void Function() setState) {
            dialog(context);
          },
          child: const TopPage()),
    );
  }
}

Future<void> dialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text("通知"),
        content: Text("通知がきました"),
        actions: <Widget>[
          // ボタン領域
          TextButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          TextButton(
            child: Text("OK"),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      );
    },
  );
}
