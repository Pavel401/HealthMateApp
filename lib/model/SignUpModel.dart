// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) =>
    SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.data,
    required this.internalResponseCode,
    required this.message,
  });

  final String data;
  final int internalResponseCode;
  final String message;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        data: json["data"],
        internalResponseCode: json["internal_response_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "internal_response_code": internalResponseCode,
        "message": message,
      };
}
