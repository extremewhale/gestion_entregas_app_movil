import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MySnackbar {
  static void show(String text) {
    Get.snackbar(
      '',
      text,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}
