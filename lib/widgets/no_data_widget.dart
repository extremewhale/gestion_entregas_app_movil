import 'package:flutter/material.dart';

class NoDataWidget extends StatelessWidget {
  String? text;

  NoDataWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Image.asset('assets/img/no_items.png'), Text(text ?? '')],
        ),
      ),
    );
  }
}
