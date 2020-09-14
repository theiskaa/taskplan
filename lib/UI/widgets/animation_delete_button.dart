import 'dart:html';

import 'package:flutter/material.dart';

class AnimationDeleteButton extends StatefulWidget {
  @override
  _AnimationDeleteButtonState createState() => _AnimationDeleteButtonState();
}

class _AnimationDeleteButtonState extends State<AnimationDeleteButton> {
  AnimationController _animationController;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;
  bool isDelete = false;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: null, 
      builder: null,
    );
  }
}
