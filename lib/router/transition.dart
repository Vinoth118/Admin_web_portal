import 'package:flutter/material.dart';

class NoPageTransitions extends PageTransitionsTheme {
  @override
  Widget buildTransitions<T>(
    route,
    context,
    animation,
    secondaryAnimation,
    child,
  ) {
    return child;
  }
}
