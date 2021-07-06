import 'package:flutter/material.dart';

class XWebScrollBar extends StatelessWidget {
  const XWebScrollBar({Key key, this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: child,
      thickness: 8,
      showTrackOnHover: true,
      isAlwaysShown: true,
      radius: const Radius.circular(5),
      hoverThickness: 10,
    );
  }
}
