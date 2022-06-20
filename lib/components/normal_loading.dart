import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class NormalLoading extends StatelessWidget {
  const NormalLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Opacity(
          opacity: 0.6,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
          ),
        ),
        LoadingAnimationWidget.halfTriangleDot(
          color: const Color.fromARGB(255, 16, 62, 101),
          size: 70,
        ),
      ],
    );
  }
}
