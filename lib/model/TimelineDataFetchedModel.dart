// To parse this JSON data, do
//
//     final timelineFetchedDataModel = timelineFetchedDataModelFromJson(jsonString);

import 'dart:convert';

TimelineFetchedDataModel timelineFetchedDataModelFromJson(String str) =>
    TimelineFetchedDataModel.fromJson(json.decode(str));

String timelineFetchedDataModelToJson(TimelineFetchedDataModel data) =>
    json.encode(data.toJson());

class TimelineFetchedDataModel {
  TimelineFetchedDataModel({
    required this.data,
    required this.internalResponseCode,
    required this.message,
  });

  final Data data;
  final int internalResponseCode;
  final String message;

  factory TimelineFetchedDataModel.fromJson(Map<String, dynamic> json) =>
      TimelineFetchedDataModel(
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

  final List<TimeLineResult> results;
  final int page;
  final int limit;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        results: List<TimeLineResult>.from(
            json["Results"].map((x) => TimeLineResult.fromJson(x))),
        page: json["Page"],
        limit: json["Limit"],
      );

  Map<String, dynamic> toJson() => {
        "Results": List<dynamic>.from(results.map((x) => x.toJson())),
        "Page": page,
        "Limit": limit,
      };
}

class TimeLineResult {
  TimeLineResult({
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
  final List<dynamic> drugs;
  final List<String> reports;
  final List<dynamic> scanFiles;

  factory TimeLineResult.fromJson(Map<String, dynamic> json) => TimeLineResult(
        visitId: json["visit_id"],
        userId: json["user_id"],
        doctor: json["doctor"],
        hospital: json["hospital"],
        timestamp: DateTime.parse(json["timestamp"]),
        type: json["type"],
        comment: json["comment"],
        drugs: List<dynamic>.from(json["drugs"].map((x) => x)),
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
