import 'dart:convert';

UserError userErrorFromJson(String str) => UserError.fromJson(json.decode(str));

String userErrorToJson(UserError data) => json.encode(data.toJson());

class UserError {
  UserError({
    this.code,
    this.message,
  });

  int? code; // Made nullable
  String? message; // Made nullable

  // Factory constructor for creating a UserError from a JSON map
  factory UserError.fromJson(Map<String, dynamic> json) => UserError(
    code: json["code"], // No need to explicitly check for null
    message: json["message"], // No need to explicitly check for null
  );

  // Method to convert a UserError to a JSON map
  Map<String, dynamic> toJson() => {
    "code": code, // Null-safe
    "message": message, // Null-safe
  };
}

