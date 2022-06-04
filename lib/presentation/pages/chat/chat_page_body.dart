import 'package:chat_functions_app/viewModel/chat_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class ChatPageBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(chatIndexProvider);
    return IndexedStack(
      index: index,
      children: [
        SendSomeone(),
        const Text('1です'),
      ],
    );
  }
}

class SendSomeone extends ConsumerWidget {
  double top = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: IndexedStack(
        index: ref.watch(sendSomeoneIndexProvider),
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTapDown: (details) {
              ref.read(widthProvider.notifier).state = 180;
              ref.read(heightProvider.notifier).state = 180;
              ref.read(offSetProvider.notifier).state = Offset(0, 0);
            },
            onTapUp: (details) {
              ref.read(widthProvider.notifier).state = 200;
              ref.read(heightProvider.notifier).state = 200;
              ref.read(offSetProvider.notifier).state = Offset(10, 10);
              ref.read(sendSomeoneIndexProvider.notifier).state = 1;
            },
            child: Positioned(
              top: top,
              child: Container(
                width: ref.watch(widthProvider),
                height: ref.watch(heightProvider),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1.0,
                      blurRadius: 10.0,
                      offset: ref.watch(offSetProvider),
                    ),
                  ],
                  shape: BoxShape.circle,
                  color: Colors.grey[400],
                ),
                alignment: Alignment.center,
                child: const Text(
                  '話す',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Lottie.asset(
            'assets/send-message.json',
          ),
        ],
      ),
    );
  }
}
