import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final Function onPress;

  TaskCard({
    this.description,
    this.title,
    this.onPress,
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
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(color: Color(0xff707070)),
        ),
        color: Color(0x464446),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
            ),
          ),
          subtitle: Text(
            description,
            style: TextStyle(
              color: Color(0xffB9B9B9),
              fontSize: 16,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              size: 35,
              color: Colors.white,
            ),
            onPressed: onPress,
          ),
        ),
      ),
    );
  }
}
