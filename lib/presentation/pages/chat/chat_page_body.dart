import 'package:chat_functions_app/components/normal_button.dart';
import 'package:chat_functions_app/theme/normal_button_style.dart';
import 'package:chat_functions_app/viewModel/chat_view_model.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:dio/dio.dart';
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
            onTap: (() async {
              try {
                ref.read(sendSomeoneIndexProvider.notifier).state++;
                final dio = Dio();
                final result = await dio.get(
                    'https://asia-northeast1-chatchat-5e181.cloudfunctions.net/sendMessageSomeone');
                print(result.data);
                dio.close();
              } on FirebaseFunctionsException catch (err) {
                print(err);
              }
            }),
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
