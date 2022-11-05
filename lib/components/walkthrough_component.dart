import 'package:flutter/material.dart';
import 'package:news_app/components/text_component.dart';

class WalkThroughComponent extends StatelessWidget {
  final String text;
  final String assets;
  final String secondaryText;

  const WalkThroughComponent({Key? key, required this.text, required this.assets, required this.secondaryText}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
        const Spacer(),
        Text(
          text, style: const TextStyle( fontSize: 18, fontWeight: FontWeight.bold),
                  ),
             const SizedBox(
               height: 20,
             ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
            child: Image.asset(assets,)),
        const SizedBox(
          height: 40,
        ),
        const Spacer(),
        TextComp(text: secondaryText)
      ],
    );
  }
}
