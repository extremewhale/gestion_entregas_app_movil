// To parse this JSON data, do
//
//     final responseApi = responseApiFromJson(jsonString);
import 'dart:convert';

ResponseApi responseApiFromJson(String str) =>
    ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {
  String? message;
  String? error;
  bool? success;
  dynamic data;
  ResponseApi({this.message, this.error, this.success, this.data});
  ResponseApi.fromJson(Map<String, dynamic> json)
      : message = json["message"] ?? "Default message",
        error = json["error"] ?? "Default error",
        success = json["success"] {
    try {
      data = json["data"];
    } catch (e) {
      print('Exception in data $e');
      data = null; // or handle it as per your default logic
    }
  }

  Map<String, dynamic> toJson() => {
        "message": message,
        "error": error,
        "success": success,
        "data": data,
      };
}
