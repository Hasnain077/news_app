import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/components/walkthrough_component.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final list = [
    WalkThroughComponent(
        text: "Where News Come First",
        assets: "assets/bbc.jpg",
        secondaryText: 'More News. More Often'),
    WalkThroughComponent(
        text: "The Power of Information",
        assets: "assets/bbc1.jpg",
        secondaryText: 'Expect The News First'),
    WalkThroughComponent(
        text: "Where News Come First",
        assets: "assets/bbc3.jpg",
        secondaryText: 'More News. More Often')
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: indicator(),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: PageView(
          children: list,
          onPageChanged: (index) {
            print(index);
            selectedIndex = index;
            setState(() {

            });
          },
        ),
      ),
    );
  }

  Widget indicator(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(list.length, (index) {
        return Container(

          height: 20,
          width: 20,
          color: selectedIndex==index? Colors.deepOrange : Colors.green,
        );
      }),

    );

  }
}
