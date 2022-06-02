import 'dart:async';
import 'dart:convert';

import 'package:chat_functions_app/service/firestore_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

final chatViewModelProvider =
    StateNotifierProvider<ChatViewModel, List<types.Message>>(
  (ref) => ChatViewModel(ref),
);

class ChatViewModel extends StateNotifier<List<types.Message>> {
  ChatViewModel(this.ref) : super([]) {}

  Ref ref;

  List<types.Message> messages = [];
  final user = const types.User(id: '06c33e8b-e835-4736-80f4-63f44b66666c');

  void addMessage(types.Message message) {
    state.insert(0, message);
  }

  void handleAtachmentPressed() {
    // showModalBottomSheet<void>(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return SafeArea(
    //       child: SizedBox(
    //         height: 144,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.stretch,
    //           children: <Widget>[
    //             TextButton(
    //               onPressed: () {
    //                 Navigator.pop(context);
    //                 _handleImageSelection();
    //               },
    //               child: const Align(
    //                 alignment: AlignmentDirectional.centerStart,
    //                 child: Text('Photo'),
    //               ),
    //             ),
    //             TextButton(
    //               onPressed: () {
    //                 Navigator.pop(context);
    //                 _handleFileSelection();
    //               },
    //               child: const Align(
    //                 alignment: AlignmentDirectional.centerStart,
    //                 child: Text('File'),
    //               ),
    //             ),
    //             TextButton(
    //               onPressed: () => Navigator.pop(context),
    //               child: const Align(
    //                 alignment: AlignmentDirectional.centerStart,
    //                 child: Text('Cancel'),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
  }

  void handleFileSelection() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      final message = types.FileMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        id: const Uuid().v4(),
        mimeType: lookupMimeType(result.files.single.path!),
        name: result.files.single.name,
        size: result.files.single.size,
        uri: result.files.single.path!,
      );

      addMessage(message);
    }
  }

  void handleImageSelection() async {
    final result = await ImagePicker().pickImage(
      imageQuality: 70,
      maxWidth: 1440,
      source: ImageSource.gallery,
    );

    if (result != null) {
      final bytes = await result.readAsBytes();
      final image = await decodeImageFromList(bytes);

      final message = types.ImageMessage(
        author: user,
        createdAt: DateTime.now().millisecondsSinceEpoch,
        height: image.height.toDouble(),
        id: const Uuid().v4(),
        name: result.name,
        size: bytes.length,
        uri: result.path,
        width: image.width.toDouble(),
      );

      addMessage(message);
    }
  }

  void handleMessageTap(BuildContext context, types.Message message) async {
    if (message is types.FileMessage) {
      await OpenFile.open(message.uri);
    }
  }

  void handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = messages.indexWhere((element) => element.id == message.id);
    if (index == -1) {
      return;
    }
    final updatedMessage = messages[index].copyWith(previewData: previewData);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      messages[index] = updatedMessage;
    });
  }

  void handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    addMessage(textMessage);
  }
}
