import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/UI/auth/auht.dart';
import 'package:todo/UI/home/home.dart';
import 'package:todo/model/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null) {
      return Auth();
    } else {
      return Home();
    }
  }
}
