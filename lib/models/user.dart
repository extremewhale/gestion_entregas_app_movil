import 'dart:convert';

User? userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? id;
  String? email;
  String? name;
  String? lastname;
  String? phone;
  String? password;
  String? sessionToken;
  String? image;
  List<User> toList = [];

  User(
      {this.id,
      this.email,
      this.name,
      this.lastname,
      this.phone,
      this.password,
      this.sessionToken,
      this.image});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] is int ? json['id'].toString() : json["id"],
        email: json["email"],
        name: json["name"],
        lastname: json["lastname"],
        phone: json["phone"],
        password: json["password"],
        sessionToken: json["session_token"],
        image: json["image"],
      );
  User.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      User user = User.fromJson(item);
      toList.add(user);
    });
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "lastname": lastname,
        "phone": phone,
        "password": password,
        "session_token": sessionToken,
        "image": image,
      };
  static User get empty => User(
        id: '',
        email: '',
        name: '',
        lastname: '',
        phone: '',
        password: '',
        sessionToken: '',
        image: '',
      );
}
