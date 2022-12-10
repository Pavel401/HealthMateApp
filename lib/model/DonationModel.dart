// To parse this JSON data, do
//
//     final donationModel = donationModelFromJson(jsonString);

import 'dart:convert';

DonationModel donationModelFromJson(String str) =>
    DonationModel.fromJson(json.decode(str));

String donationModelToJson(DonationModel data) => json.encode(data.toJson());

class DonationModel {
  DonationModel({
    required this.drugName,
    required this.pictures,
    required this.expireDate,
    required this.category,
  });

  final String drugName;
  final List<String> pictures;
  final String expireDate;
  final String category;

  factory DonationModel.fromJson(Map<String, dynamic> json) => DonationModel(
        drugName: json["drug_name"],
        pictures: List<String>.from(json["pictures"].map((x) => x)),
        expireDate: json["expire_date"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "drug_name": drugName,
        "pictures": List<dynamic>.from(pictures.map((x) => x)),
        "expire_date": expireDate,
        "category": category,
      };
}
