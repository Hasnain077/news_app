import 'package:flutter/material.dart';

class CompText extends StatelessWidget {
  final String text;
  const CompText({Key? key, required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}






