// To parse this JSON data, do
//
//     final donationsModel = donationsModelFromJson(jsonString);

import 'dart:convert';

DonationsModel donationsModelFromJson(String str) =>
    DonationsModel.fromJson(json.decode(str));

String donationsModelToJson(DonationsModel data) => json.encode(data.toJson());

class DonationsModel {
  DonationsModel({
    required this.data,
    required this.internalResponseCode,
    required this.message,
  });

  final Data data;
  final int internalResponseCode;
  final String message;

  factory DonationsModel.fromJson(Map<String, dynamic> json) => DonationsModel(
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
    required this.donationId,
    required this.userId,
    required this.status,
    required this.drugName,
    required this.expireDate,
    required this.category,
  });

  final String donationId;
  final String userId;
  final String status;
  final String drugName;
  final String expireDate;
  final String category;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        donationId: json["donation_id"],
        userId: json["user_id"],
        status: json["status"],
        drugName: json["drug_name"],
        expireDate: json["expire_date"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "donation_id": donationId,
        "user_id": userId,
        "status": status,
        "drug_name": drugName,
        "expire_date": expireDate,
        "category": category,
      };
}
