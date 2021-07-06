import 'package:flutter/material.dart';

class XTwoColumn extends StatelessWidget {
  const XTwoColumn({Key key, this.columnA, this.columnB}) : super(key: key);

  final List<Widget> columnA;
  final List<Widget> columnB;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: columnA,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: columnB,
          ),
        )
      ],
    );
  }
}
