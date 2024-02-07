import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:gestion_entrega_app/routers/app_pages.dart';
import 'package:gestion_entrega_app/routers/app_routes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await GetStorage.init('app_data');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      title: 'Delivery',
      initialRoute: AppRoutes.SPLASHSCREEN,
      getPages: AppPages.pages,
    );
  }
}
