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
    return Card(
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
        trailing: AnimationDeleteButton(onPress: onPress),
      ),
    );
  }
}


class AnimationDeleteButton extends StatefulWidget {
  final Function onPress;
  AnimationDeleteButton({this.onPress});
  @override
  _AnimationDeleteButtonState createState() => _AnimationDeleteButtonState();
}

class _AnimationDeleteButtonState extends State<AnimationDeleteButton>
    with TickerProviderStateMixin {
  final Function onPress;
  _AnimationDeleteButtonState({this.onPress});
  AnimationController _animationController;
  Animation<double> _sizeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );

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
        return GestureDetector(
          child: IconButton(
            icon: Icon(
              Icons.delete,
              color: Colors.white,
              size: _sizeAnimation.value,
            ),
            onPressed: onPress,
          ),
        );
      },
    );
  }
}
