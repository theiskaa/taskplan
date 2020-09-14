import 'package:flutter/material.dart';

class AnimationDeleteButton extends StatefulWidget {
  @override
  _AnimationDeleteButtonState createState() => _AnimationDeleteButtonState();
}

class _AnimationDeleteButtonState extends State<AnimationDeleteButton>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<Color> _colorAnimation;
  Animation<double> _sizeAnimation;
  bool isDelete = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );

    _colorAnimation = TweenSequence(
      <TweenSequenceItem<Color>>[
        TweenSequenceItem(
            tween: Tween(begin: Colors.white, end: Colors.red), weight: 38),
        TweenSequenceItem(
            tween: Tween(begin: Colors.red, end: Colors.white), weight: 38),
      ],
    ).animate(_animationController) as Animation<Color>;

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: Tween<double>(begin: 35, end: 38), weight: 38),
        TweenSequenceItem(tween: Tween<double>(begin: 38, end: 35), weight: 38),
      ],
    ).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, index) {
        return IconButton(
          icon: Icon(
            Icons.delete,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            isDelete
                ? _animationController.reverse()
                : _animationController.forward();
          },
        );
      },
    );
  }
}
