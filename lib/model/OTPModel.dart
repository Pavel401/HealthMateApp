// To parse this JSON data, do
//
//     final otpModel = otpModelFromJson(jsonString);

import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel({
    required this.data,
    required this.internalResponseCode,
    required this.message,
  });

  final Data data;
  final int internalResponseCode;
  final String message;

  factory OtpModel.fromJson(Map<String, dynamic> json) => OtpModel(
        data: Data.fromJson(json["data"]),
        internalResponseCode: json["internal_response_code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "internal_response_code": internalResponseCode,
        "message": message,
      };
}

class Data {
  Data({
    required this.pageId,
    required this.userId,
    required this.code,
    required this.validTil,
  });

  final String pageId;
  final String userId;
  final String code;
  final DateTime validTil;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pageId: json["page_id"],
        userId: json["user_id"],
        code: json["code"],
        validTil: DateTime.parse(json["valid_til"]),
      );

  Map<String, dynamic> toJson() => {
        "page_id": pageId,
        "user_id": userId,
        "code": code,
        "valid_til": validTil.toIso8601String(),
      };
}
