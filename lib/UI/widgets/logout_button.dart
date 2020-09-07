import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  final Function onPress;
  LogoutButton({this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
          child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff333333),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/logout.png', height: 25),
              SizedBox(width: 10),
              Text(
                'Logout',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Color(0xff333333),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
