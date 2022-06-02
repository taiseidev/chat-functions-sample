import 'package:chat_functions_app/screen/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await registerUserData();
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
            );
          },
          child: const Text('始める'),
        ),
      ),
    );
  }
}
