// To parse this JSON data, do
//
//     final userInfoModel = userInfoModelFromJson(jsonString);

import 'dart:convert';

UserInfoModel userInfoModelFromJson(String str) =>
    UserInfoModel.fromJson(json.decode(str));

String userInfoModelToJson(UserInfoModel data) => json.encode(data.toJson());

class UserInfoModel {
  UserInfoModel({
    required this.data,
    required this.internalResponseCode,
    required this.message,
  });

  final Data data;
  final int internalResponseCode;
  final String message;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) => UserInfoModel(
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
    required this.basicId,
    required this.userId,
    required this.age,
    required this.height,
    required this.sex,
    required this.bloodGroup,
    required this.weight,
    required this.allergies,
    required this.diseases,
    required this.pregnant,
    required this.bmi,
    required this.insulin,
  });

  final String basicId;
  final String userId;
  final int age;
  final int height;
  final String sex;
  final String bloodGroup;
  final int weight;
  final List<String> allergies;
  final List<String> diseases;
  final bool pregnant;
  final int bmi;
  final int insulin;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        basicId: json["basic_id"],
        userId: json["user_id"],
        age: json["age"],
        height: json["height"],
        sex: json["sex"],
        bloodGroup: json["blood_group"],
        weight: json["weight"],
        allergies: List<String>.from(json["allergies"].map((x) => x)),
        diseases: List<String>.from(json["diseases"].map((x) => x)),
        pregnant: json["pregnant"],
        bmi: json["bmi"],
        insulin: json["insulin"],
      );

  Map<String, dynamic> toJson() => {
        "basic_id": basicId,
        "user_id": userId,
        "age": age,
        "height": height,
        "sex": sex,
        "blood_group": bloodGroup,
        "weight": weight,
        "allergies": List<dynamic>.from(allergies.map((x) => x)),
        "diseases": List<dynamic>.from(diseases.map((x) => x)),
        "pregnant": pregnant,
        "bmi": bmi,
        "insulin": insulin,
      };
}
