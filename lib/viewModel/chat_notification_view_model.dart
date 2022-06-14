import 'package:chat_functions_app/data/service/firebase_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatNotificationProvider =
    StreamProvider.family.autoDispose<List, String>((ref, value) {
  return ref.watch(chatNotificationDataProvider(value).stream);
});
