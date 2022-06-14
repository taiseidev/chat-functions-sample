import 'package:chat_functions_app/viewModel/chat_notification_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatNotificationBody extends HookConsumerWidget {
  ChatNotificationBody(this.type, {Key? key}) : super(key: key);
  int type;
  late String collectionName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      if (type == 0) {
        collectionName = 'receive';
      } else {
        collectionName = 'send';
      }
    }, []);
    final snapshot = ref.watch(chatNotificationProvider(collectionName));
    return snapshot.when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stack) => Center(
              child: Text('Error: $error'),
            ),
        data: (snapshot) {
          return ListView.builder(
              itemCount: snapshot.length,
              itemBuilder: (context, index) {
                final data = snapshot[index];
                return Card(
                  child: ListTile(
                    title: Text(data.name),
                  ),
                );
              });
        });
  }
}
