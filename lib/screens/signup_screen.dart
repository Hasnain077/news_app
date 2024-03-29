
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_app/components/auth_component.dart';
import 'package:news_app/components/text_component.dart';
import 'package:news_app/controller/auth_controller.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isObscure = true;
  // final TextEditingController _nameController = TextEditingController();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text("Skip"),
                        Icon(Icons.arrow_right_alt_rounded),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Sign Up",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Name",
                    hintText: "Enter your full name",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    labelText: "Username or Email",
                    hintText: "Enter username or email",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: isObscure,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    labelText: "Password",
                    hintText: "Enter your password",
                    suffixIcon: GestureDetector(
                      onTap: () {
                        print("EYE TAPPED");
                        isObscure = !isObscure;
                        setState(() {});
                        print(isObscure);
                      },
                      child: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthComponent(
                  primaryText: "SignUP",
                onPrimaryClick: ()async {
                  String name = _nameController.text.trim();
                  String email = _emailController.text.trim();
                  String password = _passwordController.text;
                  if (name.isEmpty || email.isEmpty || password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill the required field")));
                    return;
                  }

                  final User? user = await AuthController(context).createAccount(name: name, email: email, password: password);
                  if (user == null && mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error: Unable to create account")));
                    return;
                  }
                  if (mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(user?.email ?? "")));
                  }
                },
                  primaryButtonColor: Colors.orange.shade500,
                  lintText: "Login",
                  secondaryText: "Already have an account?",
                  onLinkTextClick: (){
                    Navigator.pop(context);
                  },

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
