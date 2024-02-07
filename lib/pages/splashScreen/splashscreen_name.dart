import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/splashScreen/splashScreen_controller.dart';
import 'package:get/get.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: Column(
          children: [CircularProgressIndicator(), Text('cargando')],
        ),
      ),
    );
  }
}
