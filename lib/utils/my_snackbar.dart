import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackbar {
  static void show(String text) {
    Get.snackbar(
      '',
      text,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}
