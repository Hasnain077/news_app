import 'package:flutter/material.dart';
import 'package:news_app/screens/category_screen.dart';
import 'package:news_app/screens/introduction_screen.dart';
import 'package:news_app/screens/login_screen.dart';

import 'screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FirebaseAuth.instance.useAuthEmulator('localhost', 80);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),

      home: LoginScreen(),
    );
  }
}
