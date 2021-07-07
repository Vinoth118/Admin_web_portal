import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class XFilterAndSort extends StatelessWidget {
  const XFilterAndSort({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 5, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                    color: Color(0xFFE0E0E0),
                    style: BorderStyle.solid,
                    width: 1)),
            child: DropdownButton(
              underline: SizedBox(),
              items: null,
              hint: Text(
                'Filter    ',
                style: TextStyle(color: Colors.black),
              ),
              icon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: Border.all(
                    color: Color(0xFFE0E0E0),
                    style: BorderStyle.solid,
                    width: 1)),
            child: DropdownButton(
              underline: SizedBox(),
              items: null,
              hint: Text(
                'Sort  ',
                style: TextStyle(color: Colors.black),
              ),
              icon: SvgPicture.asset('assets/sort.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
