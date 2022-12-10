// To parse this JSON data, do
//
//     final publicProfileFetchedModel = publicProfileFetchedModelFromJson(jsonString);

import 'dart:convert';

PublicProfileFetchedModel publicProfileFetchedModelFromJson(String str) =>
    PublicProfileFetchedModel.fromJson(json.decode(str));

String publicProfileFetchedModelToJson(PublicProfileFetchedModel data) =>
    json.encode(data.toJson());

class PublicProfileFetchedModel {
  PublicProfileFetchedModel({
    required this.data,
    required this.internalResponseCode,
    required this.message,
  });

  final Data data;
  final int internalResponseCode;
  final String message;

  factory PublicProfileFetchedModel.fromJson(Map<String, dynamic> json) =>
      PublicProfileFetchedModel(
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
    required this.basicInfo,
    required this.visit,
  });

  final BasicInfo basicInfo;
  final List<Visit> visit;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        basicInfo: BasicInfo.fromJson(json["basic_info"]),
        visit: List<Visit>.from(json["visit"].map((x) => Visit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "basic_info": basicInfo.toJson(),
        "visit": List<dynamic>.from(visit.map((x) => x.toJson())),
      };
}

class BasicInfo {
  BasicInfo({
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

  factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
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

class Visit {
  Visit({
    required this.visitId,
    required this.userId,
    required this.doctor,
    required this.hospital,
    required this.timestamp,
    required this.type,
    required this.comment,
    required this.drugs,
    required this.reports,
    required this.scanFiles,
  });

  final String visitId;
  final String userId;
  final String doctor;
  final String hospital;
  final DateTime timestamp;
  final String type;
  final String comment;
  final List<String> drugs;
  final List<String> reports;
  final List<dynamic> scanFiles;

  factory Visit.fromJson(Map<String, dynamic> json) => Visit(
        visitId: json["visit_id"],
        userId: json["user_id"],
        doctor: json["doctor"],
        hospital: json["hospital"],
        timestamp: DateTime.parse(json["timestamp"]),
        type: json["type"],
        comment: json["comment"],
        drugs: List<String>.from(json["drugs"].map((x) => x)),
        reports: List<String>.from(json["reports"].map((x) => x)),
        scanFiles: List<dynamic>.from(json["scan_files"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "visit_id": visitId,
        "user_id": userId,
        "doctor": doctor,
        "hospital": hospital,
        "timestamp": timestamp.toIso8601String(),
        "type": type,
        "comment": comment,
        "drugs": List<dynamic>.from(drugs.map((x) => x)),
        "reports": List<dynamic>.from(reports.map((x) => x)),
        "scan_files": List<dynamic>.from(scanFiles.map((x) => x)),
      };
}
