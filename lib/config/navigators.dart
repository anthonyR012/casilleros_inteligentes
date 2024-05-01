import 'package:flutter/material.dart';

void pushReplacementWidget(Widget goTo, BuildContext context,
    {int durationAnimation = 1000, Color colorAnimation = Colors.transparent}) {
  Navigator.of(context).pushReplacement(CustomPageRoute(
      builder: (_) => goTo,
      duration: durationAnimation,
      color: colorAnimation));
}

void pushWidget(Widget goTo, BuildContext context,
    {int durationAnimation = 1000, Color colorAnimation = Colors.transparent}) {
  Navigator.of(context).push(CustomPageRoute(
      builder: (_) => goTo,
      duration: durationAnimation,
      color: colorAnimation));
}


class CustomPageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;
  final int duration;
  final Color color;

  CustomPageRoute(
      {required this.builder, required this.duration, required this.color});

  @override
  Color get barrierColor => color;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: duration);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: builder(context),
    );
  }
}
