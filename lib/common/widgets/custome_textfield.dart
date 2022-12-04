// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon? suffixIcon;
  final FocusNode? focusNode;
  final VoidCallback onFieldSubmitted;

  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.focusNode,
    required this.onFieldSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        /*contentPadding: EdgeInsets.only(
          left: deviceSize.width * 0.041,
        ),*/
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(
              146,
              146,
              146,
              1,
            ),
          ),
        ),
      ),
      onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(focusNode),
    );
  }
}
