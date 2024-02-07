// To parse this JSON data, do
//
//     final rol = rolFromJson(jsonString);

import 'dart:convert';

Rol rolFromJson(String str) => Rol.fromJson(json.decode(str));

String rolToJson(Rol data) => json.encode(data.toJson());

class Rol {
  String id;
  String? name;
  Rol({
    required this.id,
    this.name,
  });

  factory Rol.fromJson(Map<String, dynamic> json) => Rol(
        id: json["id"] is int ? json['id'].toString() : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
