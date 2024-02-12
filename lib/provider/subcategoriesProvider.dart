import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gestion_entrega_app/models/product.dart';
import 'package:gestion_entrega_app/models/subcategory.dart';

class SubcategoriesProvider {
  Dio? _dio;
  final String _endpoint = "/subcategories";
  String? sessionToken;
  SubcategoriesProvider(this._dio, {this.sessionToken});

  Future<List<SubCategory>?> findByCategory(String id) async {
    try {
      final Map<String, dynamic> headers = {
        'Content-type': 'application/json',
        'Authorization': '$sessionToken',
      };
      final Response res = await _dio!.get('$_endpoint/findByCategory/$id',
          options: Options(headers: headers));

      if (res.statusCode == 201) {
        // La actualización se realizó con éxito, el usuario está autorizado

        SubCategory subcategory = SubCategory.fromJsonList(res.data);
        return subcategory.toList;
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
