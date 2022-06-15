import 'package:chat_functions_app/data/service/firebase_analytics_service.dart';
import 'package:chat_functions_app/data/service/navigator_service.dart';
import 'package:chat_functions_app/firebase_options.dart';
import 'package:chat_functions_app/presentation/pages/home/home_page.dart';
import 'package:chat_functions_app/presentation/pages/top/top_page.dart';
import 'package:chat_functions_app/theme/normal_button_style.dart';
import 'package:chat_functions_app/theme/positive_or_negative_button_style.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_it/get_it.dart';

enum AuthorizationStatus {
  authorized,
  denied,
  notDetermined,
  provisional,
}

Future<void> _fcmBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // fcm_configパッケージを初期化
  await FCMConfig.instance.init(
    // バックグラウンド、ターミーネーテッド状態通知
    onBackgroundMessage: _fcmBackgroundHandler,
    defaultAndroidChannel: const AndroidNotificationChannel(
      'fcm_channel',
      'Fcm config',
    ),
  );
  // FCMの通知権限リクエスト
  final messaging = FirebaseMessaging.instance;
  await Future.wait([
    // iosでフォアグラウンドでheads-up通知を受け取るための設定
    FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    ),
    messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    ),
  ]);
  final locator = GetIt.instance;

  void setupLocator() {
    locator.registerLazySingleton(() => NavigationService());
    locator.registerLazySingleton(() => AnalyticsService());
  }

  setupLocator();
  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  MyApp({Key? key}) : super(key: key);
  bool? isLogined;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      final loginState = ref.read(sharedPreferencesProvider);
      isLogined = loginState.getBool('loginState');
    }, []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // analyticsのオブザーバー
      navigatorObservers: [
        AnalyticsService.observer,
      ],
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
            borderRadius: 10,
            primaryColor: Colors.black,
          ),
          PositiveOrNegativeButtonStyle(
            radius: 10,
            textColor: Colors.white,
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
      home: const TopPage(),
    );
  }
}

final sharedPreferencesProvider =
    Provider<SharedPreferences>((_) => throw UnimplementedError());
