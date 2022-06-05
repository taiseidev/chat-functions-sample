import 'package:chat_functions_app/components/normal_button.dart';
import 'package:chat_functions_app/theme/normal_button_style.dart';
import 'package:chat_functions_app/viewModel/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class ChatPageBody extends ConsumerWidget {
  const ChatPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(chatIndexProvider);
    return IndexedStack(
      index: index,
      children: [
        SendSomeone(),
        const Text('テスト'),
      ],
    );
  }
}

class SendSomeone extends ConsumerWidget {
  SendSomeone({Key? key}) : super(key: key);
  double top = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: IndexedStack(
        index: ref.watch(sendSomeoneIndexProvider),
        alignment: Alignment.center,
        children: [
          NormalButton(
            onTap: (() => ref.read(sendSomeoneIndexProvider.notifier).state++),
            style: const NormalButtonStyle(title: '誰かに送信'),
          ),
          Lottie.asset(
            'assets/send-message.json',
          ),
        ],
      ),
    );
  }
}
