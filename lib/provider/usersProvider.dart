import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

import 'package:gestion_entrega_app/models/response_api.dart';
import 'package:gestion_entrega_app/models/user.dart';
import 'package:path/path.dart';

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

  Future<ResponseApi?> create(User user) async {
    try {
      final String bodyParams = json.encode(user.toJson());
      final Map<String, dynamic> headers = {'Content-type': 'application/json'};
      final Response res = await _dio!.post('$_endpoint/create',
          data: bodyParams, options: Options(headers: headers));
      final data = res.data;
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error : $e');
      return null;
    }
  }

  Future<Stream?> createWithImage(User user, File? image) async {
    try {
      final Map<String, dynamic> headers = {'Content-type': 'application/json'};
      FormData formData = FormData.fromMap({
        'user': json.encode(user),
        if (image != null)
          'image': await MultipartFile.fromFile(
            image.path,
            filename: basename(image.path),
          ),
      });
      final response = await _dio!.post('$_endpoint/create',
          data: formData,
          options: Options(
            headers: headers,
          ));
      return Stream.fromIterable([json.encode(response.data)]);
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        print(e.response!.statusCode);
      } else {
        print(e.message);
      }
    }
  }

  Future<ResponseApi?> login(String email, String password) async {
    try {
      final String bodyParams =
          json.encode({'email': email, 'password': password});
      final Map<String, dynamic> headers = {'Content-type': 'application/json'};
      final Response res = await _dio!.post('$_endpoint/login',
          data: bodyParams, options: Options(headers: headers));
      final data = res.data;
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } on DioException catch (e) {
      if (e.response!.statusCode == 404) {
        print(e.response!.statusCode);
      } else {
        print(e.message);
      }
    }
  }

  Future<ResponseApi?> logout(String iduser) async {
    try {
      final String bodyParams = json.encode({'id': iduser});
      final Map<String, dynamic> headers = {'Content-type': 'application/json'};
      final Response res = await _dio!.post('$_endpoint/logout',
          data: bodyParams, options: Options(headers: headers));
      final data = json.decode(res.data);
      ResponseApi responseApi = ResponseApi.fromJson(data);
      return responseApi;
    } catch (e) {
      print('Error : $e');
      return null;
    }
  }
}
