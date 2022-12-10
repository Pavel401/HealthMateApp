import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/model/GetInsuranceData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class InsuranceController extends GetxController {
  List<Result> InsuranceData = [];
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
      // executes after build
      print("mabud");
      getallData();
    });
  }

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
    var base_url =
        "https://hackathonbackend-production.up.railway.app/api/v1/user/allHealthInsurance";

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
          "https://hackathonbackend-production.up.railway.app/api/v1/user/allHealthInsurance"),
      headers: header,
    );

    print("status is " + response.statusCode.toString());
    print("response body" + response.body);

    if (response.statusCode == 200) {
      GetInsurancedata getInsurancedata =
          getInsurancedataFromJson(response.body);
      // print(getParticularDateData.data.results[0].type.toString());
      // print(getInsurancedata.data.results[0]);
      InsuranceData = getInsurancedata.data.results;
      Get.forceAppUpdate();
      // Get.back();
    } else if (response.statusCode == 401) {
      Get.back();
    }
  }
}
