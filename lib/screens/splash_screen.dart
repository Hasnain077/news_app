import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:news_app/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void moveToNextPage() {
    print("Hello");

    //unnamed route
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (c) => const LoginScreen(),
        ));
  }

  @override
  void initState() {
    print("Hi");
    Timer(const Duration(seconds: 2), moveToNextPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: const Center(
          child: Text("My News App"),
        ),
      ),
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

              // fadeDuration: Duration.zero,
              // scaleDuration: Duration.zero,
              FadedScaleAnimation(child: Image.asset(
                "assets/logo1.png",
                height: 180 ,
              ),),

          ],
        ),
      ),
    );
  }
}