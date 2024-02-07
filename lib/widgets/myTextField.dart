import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String hintText = "";
  TextEditingController textEditingController;
  bool obscureText;
  TextInputType? textInputType;

  bool isPrefixIcon;
  bool issuffixIcon;
  Icon icon;

  MyTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.obscureText,
    required this.isPrefixIcon,
    required this.issuffixIcon,
    this.textInputType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.red.shade100, borderRadius: BorderRadius.circular(30)),
      child: TextField(
          keyboardType: textInputType,
          obscureText: obscureText,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(color: Colors.red),
            prefixIcon: isPrefixIcon ? icon : null,
            suffixIcon: issuffixIcon ? icon : null,
          )),
    );
  }
}
