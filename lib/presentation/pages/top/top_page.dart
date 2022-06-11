import 'package:chat_functions_app/main.dart';
import 'package:chat_functions_app/presentation/pages/top/top_page_body.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TopPage extends HookConsumerWidget {
  const TopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 匿名認証のログインをtrueに
    useEffect(() {
      final loginState = ref.read(sharedPreferencesProvider);
      loginState.setBool('loginState', true);
    }, []);
    return FCMNotificationListener(
      onNotification: (RemoteMessage notification, void Function() setState) {},
      child: const Scaffold(
        body: TopPageBody(),
      ),
    );
  }
}
