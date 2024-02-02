import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String hintText = "";
  TextEditingController textEditingController;
  bool obscureText;
  Color color;
  bool isPrefixIcon;
  bool issuffixIcon;
  Icon icon;

  MyTextField({
    super.key,
    required this.hintText,
    required this.textEditingController,
    required this.obscureText,
    required this.color,
    required this.isPrefixIcon,
    required this.issuffixIcon,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.red.shade100, borderRadius: BorderRadius.circular(30)),
      child: TextField(
          obscureText: obscureText,
          controller: textEditingController,
          decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(15),
            hintStyle: TextStyle(color: color),
            prefixIcon: isPrefixIcon ? icon : null,
            suffixIcon: issuffixIcon ? icon : null,
          )),
    );
  }
}
