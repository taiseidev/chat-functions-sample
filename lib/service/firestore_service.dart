import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

final _db = FirebaseFirestore.instance;

// 特定のルームのチャットメッセージを取得
final chatMessageProvider = StreamProvider((_) {
  return _db
      .collection('chat')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map(
            (doc) => types.Message.fromJson(doc.data()),
          )
          .toList());
});
