import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/login/login_controller.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(LoginController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('bienvenido'),
          ElevatedButton(
              onPressed: _con.goToRegisterPage, child: Text('registrate'))
        ],
      ),
    );
  }
}
