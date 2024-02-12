// To parse this JSON data, do
//
//     final SubCategory = SubCategoryFromJson(jsonString);

import 'dart:convert';

SubCategory SubCategoryFromJson(String str) =>
    SubCategory.fromJson(json.decode(str));

String SubCategoryToJson(SubCategory data) => json.encode(data.toJson());

class SubCategory {
  String? id;
  String? name;
  String? description;
  String? idcategory;
  List<SubCategory> toList = [];

  SubCategory({this.id, this.name, this.description, this.idcategory});

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        name: json["name"],
        description: json["description"],
        idcategory: json["id_category"],
      );

  SubCategory.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      SubCategory subCategory = SubCategory.fromJson(item);
      toList.add(subCategory);
    });
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "id_category": idcategory
      };
}
