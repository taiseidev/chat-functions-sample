import 'package:chat_functions_app/theme/positive_or_negative_button_style.dart';
import 'package:flutter/material.dart';

class PositiveOrNegativeButton extends StatelessWidget {
  const PositiveOrNegativeButton({
    Key? key,
    this.style,
    required this.title,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final PositiveOrNegativeButtonStyle? style;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    final defaultStyle =
        Theme.of(context).extension<PositiveOrNegativeButtonStyle>();

    final backgroundColor =
        style?.backgroundColor ?? defaultStyle!.backgroundColor;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: backgroundColor),
      onPressed: () => onPressed,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
