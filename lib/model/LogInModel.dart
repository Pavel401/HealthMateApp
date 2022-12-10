// To parse this JSON data, do
//
//     final logInModel = logInModelFromJson(jsonString);

import 'dart:convert';

LogInModel logInModelFromJson(String str) =>
    LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  LogInModel({
    required this.data,
    required this.internalResponseCode,
    required this.message,
  });

  final String data;
  final int internalResponseCode;
  final String message;

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
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
