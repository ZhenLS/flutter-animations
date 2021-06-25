import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorAnimation;
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();

    /**
     * Create controller to handle animation
     * duration: Duration of animation
     * vsync: Sync the animation with the ticker
     */
    _animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    /**
     * Use ColorTween for Color transition
     * Use .animate() to bind ColorTween with an animation controller
     */
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.redAccent)
        .animate(_animationController);

    _animationController.addListener(() {
      print(_animationController.value);
      print(_colorAnimation.value);
    });

    /**
     * Add StatusListener to trace the status of animation
     * If animation is done, reverse it
     * If animation is in init state, forward it
     */
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
          isFavourite = true;
      } else if (status == AnimationStatus.dismissed) {
          isFavourite = false;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController
        .dispose(); // After leaving page, dispose the controller so that it will not occupy resources
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: 30,
          ),
          onPressed: () {
            /**
             * Trigger the controller to start transition
             * if wanna favourite, forward the animation
             * if wanna unfavourite, reverse the animation
             */
            isFavourite
                ? _animationController.reverse()
                : _animationController.forward();
          },
        );
      },
    );
  }
}
