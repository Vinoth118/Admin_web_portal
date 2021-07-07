import 'package:admin_web_portal/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XInput extends StatelessWidget {
  const XInput({
    Key key,
    this.obscureText,
    this.controller,
    this.validator,
    this.requiredField,
    this.label,
    this.digitsOnly = false,
    this.hint,
    this.fieldName,
  })  : assert(validator == null || requiredField == null),
        super(key: key);

  final TextEditingController controller;
  final Function validator;
  final String label, hint;
  final bool requiredField;
  final bool digitsOnly;
  final bool obscureText;
  final String fieldName;

  String emptyValidator(String value) {
    if (value == null || value.isEmpty) {
      return '* Mandatory field';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        fieldName != null
            ? Column(children: [
                Text(fieldName, style: Theme.of(context).textTheme.headline5),
                SizedBox(height: 10),
              ])
            : SizedBox(),
        Container(
          height: 40,
          child: TextFormField(
            style: TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(defaultPadding / 2),
              fillColor: secondaryColor,
              filled: true,
              //floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: inputFiledBorderColor),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: inputFiledBorderColor),
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              labelText: label,
              hintText: hint,
              hintStyle: TextStyle(color: Color(0xFFC5C2C2), fontSize: 12),
            ),
            inputFormatters:
                digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
            validator: requiredField != null && requiredField
                ? emptyValidator
                : validator,
            controller: controller,
            obscureText: obscureText != null && obscureText ? true : false,
          ),
        ),
      ],
    );
  }
}
