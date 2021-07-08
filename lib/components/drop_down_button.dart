import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class XDropDownButton extends StatefulWidget {
  XDropDownButton({Key key,this.hint, this.currentItem,this.list,this.model}) : super(key: key);
  String currentItem;
  final String hint;
  final List list;
  var model;

  @override
  _XDropDownButtonState createState() => _XDropDownButtonState(hint: this.hint, currentItem: this.currentItem,list: this.list,model: this.model);
}

class _XDropDownButtonState extends State<XDropDownButton> {
  _XDropDownButtonState({this.hint, this.currentItem,this.list,this.model});
  final List list;
  var model;
  String currentItem;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width:
      MediaQuery.of(context).size.width *
          .4,
      decoration: BoxDecoration(
          borderRadius:
          BorderRadius.circular(8),
          border: Border.all(
              color: Color(0xFFE0E0E0),
              style: BorderStyle.solid,
              width: 1)),
      child: DropdownButton<String>(
        style: TextStyle(fontSize: 12),
        hint: Container(
          width: MediaQuery.of(context)
              .size
              .width *
              .31,
          child: Text(
            hint,
            style: TextStyle(
                color: Color(0xFFC5C2C2),
                fontSize: 12),
          ),
        ),
        icon: SvgPicture.asset(
            'assets/updown_arrow.svg'),
        underline: SizedBox(),
        onChanged: (newItem) {
          setState(() {
            currentItem = newItem;
          });
        },
        items: list
            .map<DropdownMenuItem<String>>(
                (model) {
              return DropdownMenuItem<String>(
                value: model.sId,
                child: Text(model.name),
              );
            }).toList(),
        value: currentItem,
      ),
    );
  }
}
