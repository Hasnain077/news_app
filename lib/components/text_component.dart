import 'package:flutter/material.dart';

class TextComp extends StatelessWidget {
  final String text;

  const TextComp({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black.withOpacity(0.6),
        ),
      ),
    );
  }
}