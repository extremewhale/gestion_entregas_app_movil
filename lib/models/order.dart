import 'package:gestion_entrega_app/models/address.dart';
import 'package:gestion_entrega_app/models/product.dart';
import 'package:gestion_entrega_app/models/user.dart';

class Order {
  String? id;
  String? idClient;
  String? idDelivery;
  String? idAddress;
  String? status;
  double? lat;
  double? lng;

  int? timestamp;
  List<Product>? products = [];
  List<Order> toList = [];
  User? client;
  User? delivery;
  Address? address;

  Order(
      {this.id,
      this.idClient,
      this.idDelivery,
      this.idAddress,
      this.status,
      this.lat,
      this.lng,
      this.timestamp,
      this.products,
      this.client,
      this.delivery,
      this.address});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"] is int ? json["id"].toString() : json["id"],
        idClient: json["id_client"],
        idDelivery: json["id_delivery"],
        idAddress: json["id_address"],
        status: json["status"],
        lat: json["lat"] is String ? double.parse(json["lat"]) : json["lat"],
        lng: json["lng"] is String ? double.parse(json["lng"]) : json["lng"],
        timestamp: json["timestamp"] is String
            ? int.parse(json["timestamp"])
            : json["timestamp"],
        products: json["products"] != null
            ? List<Product>.from(json["products"].map(
                (model) => model is Product ? model : Product.fromJson(model)))
            : [],
        client: json['client'] is String
            ? userFromJson(json['client'])
            : json['client'] is User
                ? json['client']
                : User.fromJson(json['client'] ?? {}),
        // client:
        //     json['client'] != null ? User.fromJson(json['client']) : User.empty,
        delivery: json['delivery'] is String
            ? userFromJson(json['delivery'])
            : json['delivery'] is User
                ? json['delivery']
                : User.fromJson(json['delivery'] ?? {}),
        //delivery: json['delivery'] != null
        //    ? User.fromJson(json['delivery'])
        //   : User.empty,
        address: json['address'] is String
            ? addressFromJson(json['address'])
            : json['address'] is Address
                ? json['address']
                : Address.fromJson(json['address'] ?? {}),
        // address:
        //     json['address'] != null ? Address.fromJson(json['address']) : null,
      ); // Proporciona null si json['address'] es null);

  Order.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      Order order = Order.fromJson(item);
      toList.add(order);
    });
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_client": idClient,
        "id_delivery": idDelivery,
        "id_address": idAddress,
        "status": status,
        "lat": lat,
        "lng": lng,
        "timestamp": timestamp,
        "products": products,
        "client": client,
        "delivery": delivery,
        "address": address
      };
}
