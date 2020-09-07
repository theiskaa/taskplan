import 'package:flutter/material.dart';
import 'package:todo/UI/auth/signin.dart';
import 'package:todo/UI/auth/singup.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn == true) {
      return SingIn(toggleView: toggleView);
    } else {
      return SingUp(toggleView: toggleView);
    }
  }
}
