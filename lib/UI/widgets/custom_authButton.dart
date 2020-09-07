import 'package:flutter/material.dart';

class CustomAuthButton extends StatelessWidget {
  final String title;
  final Function onPress;
  CustomAuthButton({
    this.title,
    this.onPress,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: Color(0xff312E33),
            ),
          ),
        ),
      ),
    );
  }
}
