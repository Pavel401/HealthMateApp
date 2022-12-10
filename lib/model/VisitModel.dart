// To parse this JSON data, do
//
//     final visitModel = visitModelFromJson(jsonString);

import 'dart:convert';

VisitModel visitModelFromJson(String str) =>
    VisitModel.fromJson(json.decode(str));

String visitModelToJson(VisitModel data) => json.encode(data.toJson());

class VisitModel {
  VisitModel({
    required this.data,
    required this.internalResponseCode,
    required this.message,
  });

  final Data data;
  final int internalResponseCode;
  final String message;

  factory VisitModel.fromJson(Map<String, dynamic> json) => VisitModel(
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
  final List<String> scanFiles;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        visitId: json["visit_id"],
        userId: json["user_id"],
        doctor: json["doctor"],
        hospital: json["hospital"],
        timestamp: DateTime.parse(json["timestamp"]),
        type: json["type"],
        comment: json["comment"],
        drugs: List<String>.from(json["drugs"].map((x) => x)),
        reports: List<String>.from(json["reports"].map((x) => x)),
        scanFiles: List<String>.from(json["scan_files"].map((x) => x)),
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
