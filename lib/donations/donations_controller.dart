import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/model/DonationModel.dart';
import 'package:medica/model/TimelineDataFetchedModel.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

class DonationsController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();

    super.onInit();
  }

  String? token;
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    token = prefs.getString("token"); //token
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getallData();
      // getTimelineData();
    });
  }

  List<Result> donations = [];
  Future<void> getallData() async {
    // var spinkit = SpinKitPulse(
    //   color: HealthMateColors.happyGreen,
    //   size: 50.0,
    // );
    // Get.dialog(
    //   Container(
    //     height: 100,
    //     width: 100,
    //     child: Center(
    //       child: spinkit,
    //     ),
    //   ),
    //   barrierDismissible: false,
    // );
    // print(token);
    // var base_url =
    //     "https://hackathonbackend-production.up.railway.app/api/v1/user/allMeasurementOfDate/" +
    //         ;

    // List<String> files = [fileUrl];
    // Map<String, dynamic> dataBody = {
    //   "doctor": doctorController.text.toString(),
    //   "hospital": hospitalController.text.toString(),
    //   "type": typeController.text.toString(),
    //   "comment": commentController.text.toString(),
    //   "drugs": drugs,
    //   "reports": files,
    //   "scan_files": []
    // };

    Map<String, String> header = {'Authorization': 'Bearer $token'};

    // var dataToSend = json.encode(dataBody);

    // print(base_url);
    print(token.toString());

    var response = await http.get(
      Uri.parse(
          "https://hackathonbackend-production.up.railway.app/api/v1/user/getAllDonations"),
      // body: dataToSend,
    );

    print("status" + response.statusCode.toString());

    if (response.statusCode == 200) {
      DonationsModel donationsModel = donationsModelFromJson(response.body);
      donations = donationsModel.data.results;
      Get.forceAppUpdate();
    } else if (response.statusCode == 401) {
      Get.back();
    }
  }

  //get timelines data on init state

}
