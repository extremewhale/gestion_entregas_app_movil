// To parse this JSON data, do
//
//     final Product = ProductFromJson(jsonString);

class Product {
  String? id;
  String? name;
  String? description;
  String? image1;
  String? image2;
  String? image3;
  double? price;
  int? idSubcategory;
  int? quantity;
  List<Product>? toList = [];

  Product({
    this.id,
    this.name,
    this.description,
    this.image1,
    this.image2,
    this.image3,
    this.price,
    this.idSubcategory,
    this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        name: json["name"],
        description: json["description"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        price: json["price"] is String
            ? double.parse(json["price"])
            : isInteger(json["price"])
                ? json["price"].toDouble()
                : json["price"],
        idSubcategory: json["id_subcategory"] is String
            ? int.parse(json["id_subcategory"])
            : json["id_subcategory"],
        quantity: json["quantity"],
      );

  Product.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      Product product = Product.fromJson(item);
      toList!.add(product);
    });
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "price": price,
        "id_subcategory": idSubcategory,
        "quantity": quantity,
      };

  static bool isInteger(num value) =>
      value is int || value == value.roundToDouble();
}
