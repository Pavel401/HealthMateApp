// To parse this JSON data, do
//
//     final getParticularDateData = getParticularDateDataFromJson(jsonString);

import 'dart:convert';

GetParticularDateData getParticularDateDataFromJson(String str) =>
    GetParticularDateData.fromJson(json.decode(str));

String getParticularDateDataToJson(GetParticularDateData data) =>
    json.encode(data.toJson());

class GetParticularDateData {
  GetParticularDateData({
    required this.data,
    required this.internalResponseCode,
    required this.message,
  });

  final Data data;
  final int internalResponseCode;
  final String message;

  factory GetParticularDateData.fromJson(Map<String, dynamic> json) =>
      GetParticularDateData(
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
    required this.results,
    required this.page,
    required this.limit,
  });

  final List<Result> results;
  final int page;
  final int limit;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        results:
            List<Result>.from(json["Results"].map((x) => Result.fromJson(x))),
        page: json["Page"],
        limit: json["Limit"],
      );

  Map<String, dynamic> toJson() => {
        "Results": List<dynamic>.from(results.map((x) => x.toJson())),
        "Page": page,
        "Limit": limit,
      };
}

class Result {
  Result({
    required this.measurementId,
    required this.userId,
    required this.type,
    required this.xValue,
    required this.yValue,
    required this.name,
    required this.createdAt,
    required this.takenBy,
  });

  final String measurementId;
  final String userId;
  final String type;
  final String xValue;
  final String yValue;
  final String name;
  final DateTime createdAt;
  final String takenBy;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        measurementId: json["measurement_id"],
        userId: json["user_id"],
        type: json["type"],
        xValue: json["x_value"],
        yValue: json["y_value"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        takenBy: json["taken_by"],
      );

  Map<String, dynamic> toJson() => {
        "measurement_id": measurementId,
        "user_id": userId,
        "type": type,
        "x_value": xValue,
        "y_value": yValue,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "taken_by": takenBy,
      };
}
