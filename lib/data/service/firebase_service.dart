import 'package:chat_functions_app/model/chat_notification_model.dart';
import 'package:chat_functions_app/utility/firebase_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class FirebaseService {
  static Future<UserCredential> registerUser() async {
    final auth = FirebaseAuth.instance;
    final result = await auth.signInAnonymously();
    return result;
  }

  static Future<void> registerUserDataToFirestore(String uid) async {
    try {
      final token = await FirebaseMessaging.instance.getToken();
      await FirebaseFirestore.instance.collection('user').doc(uid).set({
        'id': uid,
        'deviceToken': token,
        'isChatted': false,
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now(),
      });
    } on FirebaseException catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }
}

final _db = FirebaseFirestore.instance;

// Authに匿名ユーザーを登録
final registerAnonymouslyUserProvider =
    FutureProvider<UserCredential>((_) async {
  final auth = FirebaseAuth.instance;
  final result = await auth.signInAnonymously();
  if (kDebugMode) {
    print(result.user!.uid.toString());
  }
  return result;
});
// Firestoreにユーザーを登録
final registerUserInFirestoreProvider =
    FutureProvider.family((_, String uid) async {
  return await FirebaseFirestore.instance.collection('user').doc(uid).set({
    'id': uid,
    'createdAt': DateTime.now(),
    'updatedAt': DateTime.now(),
  });
});

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
