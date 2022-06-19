import 'package:chat_functions_app/model/chat_notification_model.dart';
import 'package:chat_functions_app/utility/firebase_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:tuple/tuple.dart';

final _db = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

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

// 送受信を受け取る
final chatNotificationDataProvider =
    StreamProvider.family.autoDispose((_, value) {
  final collection = _db
      .collection('user')
      .doc(FirebaseUtil.getCurrentUserUid())
      .collection('$value');
  final stream = collection.snapshots().map(
        (e) => e.docs
            .map(
              (e) => ChatNotificationModel.fromJson(e.data()),
            )
            .toList(),
      );
  return stream;
});

// ユーザー登録
final registerUserProvider = FutureProvider.family.autoDispose(
  (_, Tuple3 tuple) async {
    final user = await _auth.signInWithCredential(tuple.item1);
    final uuid = user.user!.uid;

    await _db.collection('user').doc(uuid).set({
      'id': uuid,
      'name': tuple.item2,
      'token': tuple.item3,
      'isChatted': false,
      'createdAt': FieldValue.serverTimestamp(),
      'updatedAt': FieldValue.serverTimestamp(),
    });
  },
);
