import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  final String title;
  AppBarTitle({this.title});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(seconds: 1),
      builder: (BuildContext context, double value, Widget child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 48,
          color: Color(0xff312E33),
        ),
      ),
    );
  }
}
