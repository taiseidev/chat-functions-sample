import 'package:chat_functions_app/theme/normal_button_style.dart';
import 'package:flutter/material.dart';

class NormalButton extends StatelessWidget {
  const NormalButton({
    Key? key,
    this.style,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final NormalButtonStyle? style;
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    final defaultStyle = Theme.of(context).extension<NormalButtonStyle>();
    final primaryColor = style?.primaryColor ?? defaultStyle?.primaryColor;
    final borderRadius = style?.borderRadius ?? defaultStyle?.borderRadius;
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        primary: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        side: const BorderSide(),
      ),
      onPressed: onTap,
      child: Text(title),
    );
  }
}
