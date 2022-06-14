import 'package:chat_functions_app/utility/firebase_util.dart';
import 'package:dio/dio.dart';
import 'package:fcm_config/fcm_config.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 依存性注入（DI）を再現したかったが、Dioのインスタンスを渡すだけだと意味ない気がする。
// DIのメリットはDioDataSource側（クライアント側？）がDioのをDioに依存しないこと。
// これではdioApiProviderに依存している？理解が浅い
final dioServiceProvider = Provider(
  (ref) => DioDataSource(
    ref.watch(dioApiProvider),
  ),
);

class DioDataSource {
  DioDataSource(this.dio);
  Dio dio;
  Future<Response> sendMessageForSomeone() async {
    final uid = FirebaseUtil.getCurrentUserUid();
    final deviceToken = await FirebaseMessaging.instance.getToken();
    dio.interceptors.add(
      LogInterceptor(),
    );
    final response = await dio.post(
      'https://asia-northeast1-chatchat-5e181.cloudfunctions.net/sendMessageSomeone',
      data: {
        'senderId': uid,
        'name': '大西泰生',
        'deviceToken': deviceToken,
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    if (kDebugMode) {
      print('RESPONSE${response.data}');
    }
    return response;
  }
}

final dioApiProvider = Provider<Dio>((ref) {
  return Dio();
});
