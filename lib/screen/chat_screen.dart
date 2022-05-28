import 'package:chat_functions_app/viewModel/chat_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatPage extends ConsumerWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(chatViewModelProvider.notifier);
    final state = ref.watch(chatViewModelProvider);
    return Scaffold(
      body: Chat(
        messages: state,
        onAttachmentPressed: notifier.handleAtachmentPressed,
        onMessageTap: notifier.handleMessageTap,
        onPreviewDataFetched: notifier.handlePreviewDataFetched,
        onSendPressed: notifier.handleSendPressed,
        user: notifier.user,
      ),
    );
  }
}
