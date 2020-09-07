import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff312E33),
      child: Center(
        child: SpinKitCubeGrid(
          size: 80,
          color: Colors.white,
        ),
      ),
    );
  }
}
