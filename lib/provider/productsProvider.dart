import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_entrega_app/models/product.dart';

class ProductsProvider {
  Dio? _dio;
  final String _endpoint = "/products";
  String? sessionToken;
  ProductsProvider(this._dio, {this.sessionToken});

  Future<List<Product?>?> findBySubCategory(String id) async {
    try {
      final Map<String, dynamic> headers = {
        'Content-type': 'application/json',
        'Authorization': '$sessionToken',
      };
      final Response res = await _dio!.get('$_endpoint/findBySubCategory/$id',
          options: Options(headers: headers));
      ;

      if (res.statusCode == 201) {
        // La actualización se realizó con éxito, el usuario está autorizado
        final productsjson = res.data;
        Product products = Product.fromJsonList(productsjson);
        return products.toList;
      } else if (res.statusCode == 401) {
        Fluttertoast.showToast(msg: 'tu sesion expiro');
        print('Error de autorización: ${res.statusCode}');
        return null;
      } else {
        print('Error : ${res.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
