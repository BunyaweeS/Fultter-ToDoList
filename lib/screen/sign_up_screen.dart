import 'dart:html';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_screen/component/my_button.dart';
import 'package:onboarding_screen/component/my_iconbtn.dart';
import 'package:onboarding_screen/component/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final repasswordController = TextEditingController();

  SignUpWithEmail() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showMyDialog("Created Successfully");
    } on FirebaseAuthException catch (e) {
      _showMyDialog('Failed with error code:${e.code}');
      print(e.message);
    }
  }
    createUserWithEmailAndPassword() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
  void _showMyDialog(String txtMsg) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            backgroundColor: Colors.amberAccent,
            title: const Text('AlertDialog'),
            content: Text(txtMsg),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Column(
          children: [
            const Spacer(),
            Text(
              'Welcome to PARADISE',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            Text(
              '\n to get to PARADISE,pls provide your information to crate account\n',
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.displaySmall,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                Controller: nameController,
                hintText: 'Enter your name or I will SHOOT',
                obscureText: false,
                labelText: 'Name'),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                Controller: emailController,
                hintText: 'Enter your email Do not ask',
                obscureText: false,
                labelText: 'Email'),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                Controller: passwordController,
                hintText: 'Enter your password',
                obscureText: true,
                labelText: 'Password'),
            const SizedBox(
              height: 20,
            ),
            MyTextField(
                Controller: repasswordController,
                hintText: 'Enter your re-password Dont ask just fill in',
                obscureText: true,
                labelText: 'Re-Password'),
            const SizedBox(
              height: 20,
            ),
            MyButton(onTap: SignUpWithEmail, hinText: 'Registered'),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Or Continue with',
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyIconButton(imagPath: 'assets/images/google_icon.png'),
                SizedBox(
                  width: 20,
                ),
                MyIconButton(imagPath: 'assets/images/apple_icon.png'),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
