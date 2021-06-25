import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorAnimation;

  @override
  void initState() {
    super.initState();

    /**
     * Create controller to handle animation
     * duration: Duration of animation
     * vsync: Sync the animation with the ticker
     */
    _animationController =
        AnimationController(duration: Duration(milliseconds: 200), vsync: this);

    /**
     * Use ColorTween for Color transition
     * Use .animate() to bind ColorTween with an animation controller
     */
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.redAccent)
        .animate(_animationController);

    _animationController.forward();

    _animationController.addListener(() {
      print(_animationController.value);
      print(_colorAnimation.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.favorite,
        color: Colors.grey[400],
        size: 30,
      ),
      onPressed: () {},
    );
  }
}
