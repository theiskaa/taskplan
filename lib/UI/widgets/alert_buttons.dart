import 'package:flutter/material.dart';

class AlertButton extends StatelessWidget {
  final Function onPress;
  final String title;

  AlertButton({
    this.onPress,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(
          color: Color(0xff333333),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xff707070),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AlertButtonClose extends StatelessWidget {
  final Function onPress;
  final String title;

  AlertButtonClose({
    this.onPress,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(0xff707070),
          ),
        ),
        child: Center(
          child: Text(title),
        ),
      ),
    );
  }
}
