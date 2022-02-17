import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  String username;
  String first_name;
  String last_name;
  String email;

  LoginData({
    required this.username,
    required this.first_name,
    required this.last_name,
    required this.email
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
      username: json["username"],
      first_name: json["first_name"],
      last_name: json["last_name"],
      email: json["email"]);

  Map<String, dynamic> toJson() => {
    "username": username,
    "first_name": first_name,
    "last_name": last_name,
    "email": email
  };
}