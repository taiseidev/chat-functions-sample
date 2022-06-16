import 'package:flutter/material.dart';

class TopPageBackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 150,
          left: 200,
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.question_mark,
              size: 80,
              color: Color.fromARGB(255, 16, 62, 101),
            ),
          ),
        ),
        Positioned(
          top: 450,
          left: 200,
          child: Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.question_mark,
              size: 80,
              color: Color.fromARGB(255, 16, 62, 101),
            ),
          ),
        ),
        Positioned(
          top: 250,
          left: 50,
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 600,
          right: 200,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.question_mark,
              size: 80,
              color: Color.fromARGB(255, 16, 62, 101),
            ),
          ),
        ),
      ],
    );
  }
}
