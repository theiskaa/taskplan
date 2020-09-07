import 'package:flutter/material.dart';
import 'package:todo/UI/responsive/responsive_widget.dart';
import 'package:todo/UI/widgets/custom_appbar.dart';
import 'package:todo/UI/widgets/custom_authButton.dart';
import 'package:todo/UI/widgets/custom_textField.dart';
import 'package:todo/UI/widgets/loading.dart';
import 'package:todo/services/auth_service.dart';

class SingIn extends StatefulWidget {
  final Function toggleView;
  SingIn({this.toggleView});
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email = "";
  String password = "";

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Loading()
        : ResponsiveWidget(
            appbar: buildCustomAppBar(),
            builder: (context, cons) {
              return buildBody();
            },
          );
  }

  CustomAppBar buildCustomAppBar() {
    return CustomAppBar(
      height: 180,
      color: Colors.white,
      title: 'Sign In',
    );
  }

  SingleChildScrollView buildBody() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 80),
      child: Column(
        children: [
          buildFields(),
          SizedBox(height: 15),
          buildAuthButtons(),
        ],
      ),
    );
  }

  Column buildAuthButtons() {
    return Column(
      children: [
        //?
        CustomAuthButton(
          title: 'Sing In',
          onPress: () async {
            if (_formKey.currentState.validate()) {
              setState(() => isLoading = true);
              dynamic result = await _auth.singIn(email, password);
              if (result == null) {
                setState(() {
                  isLoading = false;
                });
              }
            }
          },
        ),
        SizedBox(height: 15),
        navigatorToSignIn()
      ],
    );
  }

  Row navigatorToSignIn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Haven't an account?",
          style: TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            widget.toggleView();
          },
          child: Text(
            'Sing Up',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Form buildFields() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 15),
          CustomTxTFieldForAuth(
            label: 'Email',
            obscureText: false,
            validator: (val) => val.isEmpty ? 'Enter an email!' : null,
            onChanged: (val) {
              setState(() {
                return email = val;
              });
            },
          ),
          SizedBox(height: 15),
          CustomTxTFieldForAuth(
            label: 'Password',
            obscureText: true,
            validator: (val) =>
                val.length < 6 ? 'Enter min 6 charachter' : null,
            onChanged: (val) {
              setState(() {
                return password = val;
              });
            },
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
