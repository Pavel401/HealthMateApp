// To parse this JSON data, do
//
//     final fileUploadModel = fileUploadModelFromJson(jsonString);

import 'dart:convert';

FileUploadModel fileUploadModelFromJson(String str) =>
    FileUploadModel.fromJson(json.decode(str));

String fileUploadModelToJson(FileUploadModel data) =>
    json.encode(data.toJson());

class FileUploadModel {
  FileUploadModel({
    required this.data,
    required this.internalResponseCode,
    required this.message,
  });

  final Data data;
  final int internalResponseCode;
  final String message;

  factory FileUploadModel.fromJson(Map<String, dynamic> json) =>
      FileUploadModel(
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
    required this.fileId,
    required this.userId,
    required this.awsLink,
    required this.createdAt,
  });

  final String fileId;
  final String userId;
  final String awsLink;
  final DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fileId: json["file_id"],
        userId: json["user_id"],
        awsLink: json["aws_link"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "file_id": fileId,
        "user_id": userId,
        "aws_link": awsLink,
        "created_at": createdAt.toIso8601String(),
      };
}
