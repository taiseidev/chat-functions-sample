import 'package:chat_functions_app/components/normal_button.dart';
import 'package:chat_functions_app/components/normal_dialog.dart';
import 'package:chat_functions_app/data/service/firebase_analytics_service.dart';
import 'package:chat_functions_app/viewModel/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class ChatPageBody extends ConsumerWidget {
  const ChatPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChatted = ref.watch(isChattedProvider);
    return IndexedStack(
      index: isChatted,
      children: const [
        SendSomeone(),
        Text('チャット中です'),
      ],
    );
  }
}

class SendSomeone extends ConsumerWidget {
  const SendSomeone({Key? key}) : super(key: key);
  final double top = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: IndexedStack(
        index: ref.watch(isSendedProvider),
        alignment: Alignment.center,
        children: [
          NormalButton(
            title: '誰かに送信',
            onTap: (() async {
              showDialog(
                context: context,
                builder: (_) => NormalDialog(
                  title: '誰かにチャット依頼を送信しますか？',
                  content: '相手が許可するとチャットルームが開かれます📩',
                  actions: Column(
                    children: [
                      NormalButton(
                        title: '送信 🚀',
                        onTap: () async {
                          Navigator.pop(context);
                          final analyticsService = GetIt.I<AnalyticsService>();
                          analyticsService.sendButtonEvent(
                              buttonName: '送信ボタンを押下');
                          // ref.read(isSendedProvider.notifier).state = 1;
                          await ref.read(
                              sendMessageForSomeoneViewModelProvider.future);
                          // await Future.delayed(const Duration(seconds: 3)).then(
                          //     (value) => ref.read(isSendedProvider.notifier).state = 0);
                        },
                      ),
                      NormalButton(
                        title: 'やめる 😢',
                        onTap: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          Lottie.asset(
            'assets/send-message.json',
          ),
        ],
      ),
    );
  }
}
