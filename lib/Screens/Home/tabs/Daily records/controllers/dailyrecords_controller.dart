import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:medica/Screens/Profile/sub%20pages/controller/addTimelineController.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/model/GetParticulardateMesurementData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DailyRecordsController extends GetxController {
  TextEditingController dateinput = TextEditingController(text: "");

  List<Result> dataFrom_a_particular_date = [];

  @override
  void onInit() {
    // TODO: implement onInit
    getStringValuesSF();
    dateinput.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    // AddTimeLineController addTimeLineController =
    //     Get.put(AddTimeLineController());
    super.onInit();
  }

  String? token;
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    token = prefs.getString("token"); //token
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // executes after build
      getallData();
    });
  }

  Future<void> getallData() async {
    // print(token);
    var base_url =
        "https://hackathonbackend-production.up.railway.app/api/v1/user/allMeasurementOfDate/" +
            dateinput.text;
    // Map<String, dynamic> dataBody = {
    //   "age": int.parse(ageController.text),
    //   "height": heightController.text,
    //   "sex": Gender.toString() == "Male" ? "M" : "F",
    //   "blood_group": blood.value.toString() + bloodType.value.toString(),
    //   "weight": int.parse(weightController.text),
    //   "allergies": selectedAllergens.toList(),
    //   "diseases": selectedDiseases
    // };

    Map<String, String> header = {'Authorization': 'Bearer $token'};

    // print(dataToSend);

    // print(base_url);
    // print(token.toString());

    var response = await http.get(
      Uri.parse(
          "https://hackathonbackend-production.up.railway.app/api/v1/user/allMeasurementOfDate/" +
              dateinput.text),
      headers: header,
    );

    print("status" + response.statusCode.toString());

    if (response.statusCode == 200) {
      GetParticularDateData getParticularDateData =
          getParticularDateDataFromJson(response.body);
      // print(getParticularDateData.data.results[0].type.toString());
      dataFrom_a_particular_date = getParticularDateData.data.results;
      Get.forceAppUpdate();
    } else if (response.statusCode == 401) {
      Get.back();
    }
  }
}
