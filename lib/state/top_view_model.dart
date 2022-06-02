import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final registerUserProvider = Provider((_) {
  Future<void> registerUserData() async {
    final auth = FirebaseAuth.instance;
    try {
      final user = await auth.signInAnonymously();
      final uid = user.user!.uid;
      await FirebaseFirestore.instance.collection('user').doc(uid).set({
        'id': uid,
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now()
      });
    } catch (e) {}
  }
});
