import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/services/auth_service.dart';
import 'package:todo/services/wapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
