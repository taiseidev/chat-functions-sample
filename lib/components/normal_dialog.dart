import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NormalDialog extends ConsumerWidget {
  const NormalDialog({
    Key? key,
    this.title,
    this.content,
    this.actions,
  }) : super(key: key);

  final String? title;
  final String? content;
  final Column? actions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: Text(title ?? ''),
      content: Text(content ?? ''),
      actions: <Widget>[
        actions ?? const SizedBox.shrink(),
      ],
    );
  }
}
