import 'package:chat_functions_app/data/service/firebase_service.dart';
import 'package:chat_functions_app/viewModel/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(chatViewModelProvider.notifier);
    final chatMessage = ref.watch(chatMessageProvider);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: const Text(
              '大西泰生',
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: chatMessage.when(
            data: ((message) {
              return Chat(
                // メッセージ入力欄を制御
                theme: const DefaultChatTheme(
                  inputTextDecoration: InputDecoration(
                    filled: true,
                    // メッセージ入力フォームの色
                    // fillColor: Colors.red,
                    // paddingを制御
                    // isDense: true,
                    // contentPadding: EdgeInsets.zero,
                  ),
                  // メッセージ入力欄のアイコンとテキストの色
                  // inputTextColor: Colors.black,
                  // メッセージ入力欄の外枠背景
                  // inputBackgroundColor: Colors.red,
                  // 入力カーソルの色
                  inputTextCursorColor: Colors.white,
                  // メッセージ入寮欄の丸み
                  // inputBorderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(20),
                  //   topRight: Radius.circular(20),
                  // ),
                  // padding
                  inputPadding: EdgeInsets.all(4),
                ),

                messages: message,
                onAttachmentPressed: notifier.handleAtachmentPressed,
                onMessageTap: notifier.handleMessageTap,
                onPreviewDataFetched: notifier.handlePreviewDataFetched,
                onSendPressed: notifier.handleSendPressed,
                user: notifier.user,
              );
            }),
            error: (err, stack) => Lottie.network(
                'https://assets2.lottiefiles.com/packages/lf20_bhw1ul4g.json'),
            loading: () => Center(
              child: Lottie.network(
                  'https://assets9.lottiefiles.com/packages/lf20_x62chJ.json'),
            ),
          )),
    );
  }
}
