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
  })  : assert(validator == null || requiredField == null),
        super(key: key);

  final TextEditingController controller;
  final Function validator;
  final String label, hint;
  final bool requiredField;
  final bool digitsOnly;
  final bool obscureText;

  String emptyValidator(String value) {
    if (value == null || value.isEmpty) {
      return '* Mandatory field';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: TextFormField(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(),
          labelText: label,
          hintText: hint,
        ),
        inputFormatters:
            digitsOnly ? [FilteringTextInputFormatter.digitsOnly] : null,
        validator:
            requiredField != null && requiredField ? emptyValidator : validator,
        controller: controller,
        obscureText: obscureText != null && obscureText ? true : false,
      ),
    );
  }
}
