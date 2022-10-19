import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController{
  final BuildContext context;
  AuthController(this.context);

  Future<User?> createAccount({String? name, String? email, String? password}) async{
    if(name==null || email==null || password==null){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please fill the required field')));
      return null;
    }
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('The password provided is too weak.')));
        // print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('The account already exists for that email')));
        // print('The account already exists for that email.');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));   //ask
      // print(e);
      return null;


    }
   return null;

  }



}
