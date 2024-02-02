import 'package:flutter/material.dart';
import 'package:gestion_entrega_app/pages/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _con = Get.put(RegisterController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('bienvenido'),
          ElevatedButton(onPressed: _con.goToLoginPage, child: Text('logeate')),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(onPressed: _con.getAll, child: Text('ver usuarios')),
        ],
      ),
    );
  }
}
