import 'package:flutter/material.dart';
import 'package:todo/UI/responsive/size_info.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget appbar;
  final Widget fab;
  final Widget Function(BuildContext context, SizeInformation constraints)
      builder;

  ResponsiveWidget({@required this.appbar, this.builder,this.fab,});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    SizeInformation sizeInformation = SizeInformation(
      width: width,
      height: height,
      orientation: orientation,
    );

    return SafeArea(
      child: Scaffold(
        appBar: appbar,
        floatingActionButton: fab,
        backgroundColor: Color(0xff333333),
        body: Builder(builder: (context) {
          return builder(context, sizeInformation);
        }),
      ),
    );
  }
}
