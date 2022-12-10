import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:medica/Screens/ViewPublicProfile.dart/ViewPublicProfile.dart';
import 'package:medica/Screens/ViewPublicProfile.dart/full_screen_view.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/model/FetchPublicProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PublicProfileFetchController extends GetxController {
  TextEditingController otp = TextEditingController(text: "");
  Data? data;

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
    WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  Future<void> fetchPublicData(String otp) async {
    print(token.toString());

    var response = await http.get(
      Uri.parse(
          "https://hackathonbackend-production.up.railway.app/api/v1/user/verify/" +
              otp),
    );

    print("ss" + response.statusCode.toString());

    if (response.statusCode == 200) {
      PublicProfileFetchedModel fetchedModel =
          PublicProfileFetchedModel.fromJson(json.decode(response.body));
      data = fetchedModel.data;
      print("data is " + data!.visit[0].hospital);
      Get.to(View(
        data: fetchedModel.data,
      ));
    } else if (response.statusCode == 401) {
      Get.back();
    }
  }

  //get timelines data on init state

  // List<TimeLineResult> timelines = [];

}
