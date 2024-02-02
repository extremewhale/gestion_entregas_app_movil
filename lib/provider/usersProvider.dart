import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gestion_entrega_app/models/user.dart';
import 'package:gestion_entrega_app/utils/dio_client.dart';
import 'package:get/get.dart';

class UsersProvider {
  Dio? _dio;
  final String _endpoint = "/users";
  UsersProvider(this._dio);

  Future<List<User>?> getAll() async {
    try {
      final response = await _dio!.get(
        '$_endpoint/getAll',
      );
      final usersJson = response.data;
      User users = User.fromJsonList(usersJson);
      return users.toList;
    } catch (e) {
      print('Error : $e');
      return null;
    }
  }
}
