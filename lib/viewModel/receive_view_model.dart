import 'package:chat_functions_app/data/service/firebase_service.dart';
import 'package:chat_functions_app/model/receive_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final receiveNotificationProvider =
    StreamProvider.family.autoDispose<List, String>((ref, value) {
  return ref.watch(receiveNotificationDataProvider(value).stream);
});
