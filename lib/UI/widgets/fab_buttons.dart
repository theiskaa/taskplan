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
    return GestureDetector(
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
    );
  }
}
