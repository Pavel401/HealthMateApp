// To parse this JSON data, do
//
//     final getInsurancedata = getInsurancedataFromJson(jsonString);

import 'dart:convert';

GetInsurancedata getInsurancedataFromJson(String str) =>
    GetInsurancedata.fromJson(json.decode(str));

String getInsurancedataToJson(GetInsurancedata data) =>
    json.encode(data.toJson());

class GetInsurancedata {
  GetInsurancedata({
    required this.data,
    required this.internalResponseCode,
    required this.message,
  });

  final Data data;
  final int internalResponseCode;
  final String message;

  factory GetInsurancedata.fromJson(Map<String, dynamic> json) =>
      GetInsurancedata(
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
    required this.webScraperStartUrl,
    required this.name,
    required this.provider,
    required this.networkHospitals,
    required this.claimSettlementRatio,
    required this.coPayment,
    required this.roomRent,
    required this.diseaseSubLimit,
    required this.preExistingDiseasesWaiting,
    required this.noClaimBonus,
    required this.healthCheckUp,
  });

  final String webScraperStartUrl;
  final String name;
  final String provider;
  final String networkHospitals;
  final String claimSettlementRatio;
  final String coPayment;
  final String roomRent;
  final String diseaseSubLimit;
  final String preExistingDiseasesWaiting;
  final String noClaimBonus;
  final String healthCheckUp;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        webScraperStartUrl: json["web-scraper-start-url"],
        name: json["name"],
        provider: json["provider"],
        networkHospitals: json["network_hospitals"],
        claimSettlementRatio: json["claim_settlement_ratio"],
        coPayment: json["co_payment"],
        roomRent: json["room_rent"],
        diseaseSubLimit: json["disease_sub_limit"],
        preExistingDiseasesWaiting: json["pre_existing_diseases_waiting"],
        noClaimBonus: json["no_claim_bonus"],
        healthCheckUp: json["health_check_up"],
      );

  Map<String, dynamic> toJson() => {
        "web-scraper-start-url": webScraperStartUrl,
        "name": name,
        "provider": provider,
        "network_hospitals": networkHospitals,
        "claim_settlement_ratio": claimSettlementRatio,
        "co_payment": coPayment,
        "room_rent": roomRent,
        "disease_sub_limit": diseaseSubLimit,
        "pre_existing_diseases_waiting": preExistingDiseasesWaiting,
        "no_claim_bonus": noClaimBonus,
        "health_check_up": healthCheckUp,
      };
}
