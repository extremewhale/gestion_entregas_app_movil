import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_entrega_app/models/category.dart';
import 'package:gestion_entrega_app/models/product.dart';

class CategoriesProvider {
  Dio? _dio;
  final String _endpoint = "/categories";
  String? sessionToken;
  CategoriesProvider(this._dio, {this.sessionToken});

  Future<List<Category>?> getAll() async {
    try {
      final Map<String, dynamic> headers = {
        'Content-type': 'application/json',
        'Authorization': '$sessionToken',
      };
      final Response res = await _dio!
          .get('$_endpoint/getAll', options: Options(headers: headers));
      if (res.statusCode == 201) {
        Category category = Category.fromJsonList(res.data);
        return category.toList;
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
