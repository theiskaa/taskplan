import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(230);

  final String title;
  final double height;
  final Color color;
  final Function onPress;

  CustomAppBar({
    this.title,
    this.height,
    this.color,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                iconSize: 35,
                icon: Icon(
                  Icons.settings,
                  color: color,
                ),
                onPressed: onPress,
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 48,
                  color: Color(0xff312E33),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
