import 'package:flutter/material.dart';

class MyButtom extends StatelessWidget {
  String textButtom = "";
  Color color;
  Function function;

  MyButtom({super.key, required this.textButtom, required this.color , required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
      child: ElevatedButton(
        onPressed: function(),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: const EdgeInsets.symmetric(vertical: 15)),
        child: Text(
          textButtom,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}
