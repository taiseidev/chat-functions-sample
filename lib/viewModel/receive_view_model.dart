import 'package:flutter_riverpod/flutter_riverpod.dart';

final receiveNotificationProvider =
    StreamProvider.autoDispose<List<String>>((ref) {});
