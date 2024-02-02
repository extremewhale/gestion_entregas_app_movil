import 'package:dio/dio.dart';
import 'package:gestion_entrega_app/config/environments.dart';

class DioClient {
  Dio? _dio;
  Duration duration = Duration(milliseconds: 5000);

  DioClient() {
    _dio = Dio();
    _dio!.options.baseUrl = Environment.URL_API_BACKEND;
    _dio!.options.connectTimeout = duration; // 5 segundos
    // Agrega headers comunes si es necesario
    _dio!.options.headers = {'Content-Type': 'application/json'};
  }
  

  Dio get instance => _dio!;
}
