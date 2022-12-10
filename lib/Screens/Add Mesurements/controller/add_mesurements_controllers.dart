import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:medica/Screens/Home/tabs/Daily%20records/controllers/dailyrecords_controller.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddMesurementsController extends GetxController {
  final sinUpKey = GlobalKey<FormState>();
  final logInKey = GlobalKey<FormState>();
  late BuildContext context;
  TextEditingController type = TextEditingController(text: "");
  TextEditingController x_value = TextEditingController(text: "");
  TextEditingController y_value = TextEditingController(text: "");
  TextEditingController name = TextEditingController(text: "");
  TextEditingController taken_by = TextEditingController(text: "");
  TextEditingController dateinput = TextEditingController(text: "");
  //text editing controller for text field

  String? token;
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    token = prefs.getString("token"); //token
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();

    dateinput.text = DateFormat('yyyy-MM-dd').format(DateTime.now());

    ///set the initial value of text field

    super.onInit();
  }

  List MesurementsTypes = ['Glucose', 'Hemoglobin', 'BloodPreasure'];
  final MesurementsType = "Glucose".obs;
  void setSelectedType(String value) {
    MesurementsType.value = value;
  }

  var base_url =
      "https://hackathonbackend-production.up.railway.app/api/v1/user/measurement";

  Future<void> sendPostDataToServer() async {
    var spinkit = SpinKitPulse(
      color: HealthMateColors.happyGreen,
      size: 50.0,
    );
    Get.dialog(
      Container(
        height: 100,
        width: 100,
        child: Center(
          child: spinkit,
        ),
      ),
      barrierDismissible: false,
    );
    print(token);
    Map<String, dynamic> dataBody = {
      "type": MesurementsType.toString(),
      "x_value": x_value.text.toString(),
      "y_value": y_value.text.toString(),
      "name": MesurementsType.toString(),
      "taken_by": "Self"
    };

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var dataToSend = json.encode(dataBody);

    print(dataToSend);
    print(base_url);
    print(token);

    var response =
        await http.post(Uri.parse(base_url), headers: header, body: dataToSend);

    print("status" + response.statusCode.toString());
    print("response body" + response.body);

    if (response.statusCode == 200) {
      Get.back();
      Get.back();
      dailyRecordsController.getallData();
    } else if (response.statusCode == 401) {}
  }

  DailyRecordsController dailyRecordsController =
      Get.put(DailyRecordsController());
}
