import 'package:flutter/material.dart';

class FAB extends StatelessWidget {
  final Function onPress;
  final String title;

  FAB({
    this.onPress,
    this.title,
  });

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
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Center(
            child: Image.asset('assets/plus.png', height: 35),
          ),
        ),
      ),
    );
  }
}
