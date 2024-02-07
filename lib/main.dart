import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gestion_entrega_app/config/environments.dart';
import 'package:gestion_entrega_app/routers/app_pages.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HOLA',
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.pages,
    );
  }
}
