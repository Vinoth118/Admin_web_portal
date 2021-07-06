import 'package:admin_web_portal/utils/constants.dart';
import 'package:flutter/material.dart';
class XSearchBar extends StatelessWidget {
  const XSearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width * .40,
      child: TextField(
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(defaultPadding / 2),
          hintText: "Search",
          fillColor: bgColor,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
