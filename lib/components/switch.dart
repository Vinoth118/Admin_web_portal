import 'package:flutter/material.dart';

class XSwitch extends StatelessWidget {
  const XSwitch({Key key, this.onChanged, this.value, this.label})
      : super(key: key);

  final Function onChanged;
  final bool value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (label != null && label.isNotEmpty) ...{
          Text(label),
          SizedBox(
            height: 5,
          ),
          Spacer(),
        },
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Switch(
            value: value,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
