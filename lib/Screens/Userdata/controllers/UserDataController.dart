import 'dart:convert';
import 'dart:math';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:medica/Navigation/Navigation.dart';
import 'package:medica/Screens/Home/home.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/model/UserInfoModel.dart';
import 'package:http/http.dart' as http;
import 'package:medica/repository/base_url.dart';
import 'package:medica/repository/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataController extends GetxController {
  UserDataController({required this.context});

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
  }

  final sinUpKey = GlobalKey<FormState>();
  final logInKey = GlobalKey<FormState>();
  late BuildContext context;
  TextEditingController ageController = TextEditingController(text: "");
  TextEditingController weightController = TextEditingController(text: "");
  TextEditingController heightController = TextEditingController();
  // TextEditingController insulin = TextEditingController();

  var weight = 0.obs;
  List bloodGroup = ['O', 'A', 'B', 'AB'];
  List pregents = ['YES', 'NO'];
  final pregnent = "NO".obs;
  void setPregnet(String value) {
    pregnent.value = value;
  }

  List insulins = ['YES', 'NO'];
  final insulin = "NO".obs;
  void setInsulin(String value) {
    pregnent.value = value;
  }

  // set() {
  //   // double weight = double.parse(_weightController.text);
  //   // double height = double.parse(_heightController.text);
  //   var bmi = (703 * double.parse(weightController.text)) /
  //       pow(double.parse(heightController.text) * 12, 2);
  // }

  List bloodTypes = ['+', '-'];
  final bloodType = "+".obs;

  final blood = "O".obs;

  final Gender = "Male".obs;
  List dropdownText = ['Male', 'Female', 'Other'];

  void setBloodType(String value) {
    bloodType.value = value;
  }

  void setBlood(String value) {
    blood.value = value;
  }

  void setSelected(String value) {
    Gender.value = value;
  }

  RxList selectedDiseases = [].obs;

  List<String> diseases = [
    "Asthma",
    "Cancer",
    "Diabetes",
    "Heart Disease",
    "Hypertension",
    "Kidney Disease",
    "Liver Disease",
    "Stroke",
    "Thyroid Disease",
    "Depression",
    "Anxiety",
    "Epilepsy",
    "Alzheimer's Disease",
    "Animea",
    "Arthritis",
    "Celiac Disease",
  ];

  RxList selectedAllergens = [].obs;
  List<String> allergens = [
    "Pollen",
    "Fish",
    "Lactose",
    "Nuts",
    "Rubber",
    "Egg",
    "Wheat",
    "Soy",
    "Shell Fish",
    "Sesame",
    "Dust"
  ];

  void checkBeforePost() {
    // if (ageController.text.isEmpty ||
    //     weightController.text.isEmpty ||
    //     heightController.text.isEmpty ||
    //     selectedDiseases.isEmpty ||
    //     selectedAllergens.isEmpty ||
    //     Gender.value.toString() != "") {
    //   final snackBar = SnackBar(
    //     /// need to set following properties for best effect of awesome_snackbar_content
    //     elevation: 0,
    //     behavior: SnackBarBehavior.floating,
    //     backgroundColor: Colors.transparent,
    //     content: AwesomeSnackbarContent(
    //       title: 'On No!',
    //       message: 'Please fill all the details to continue',

    //       /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
    //       contentType: ContentType.failure,
    //     ),
    //   );

    // print(ageController.text.toString() +
    //     "   " +
    //     weightController.text.toString() +
    //     "   " +
    //     heightController.text +
    //     "   " +
    //     Gender.value.toString() +
    //     "   " +
    //     selectedAllergens.toString() +
    //     "   " +
    //     selectedDiseases.toString());
    // } else {
    sendPostDataToServer();
    // }
  }

  Future<void> sendPostDataToServer() async {
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
    var bmi = (703 * double.parse(weightController.text)) /
        pow(double.parse(heightController.text) * 12, 2);
    // print(token);
    Map<String, dynamic> dataBody = {
      "age": int.parse(ageController.text),
      "height": 180,
      "sex": Gender.toString() == "Male" ? "M" : "F",
      "blood_group": blood.value.toString() + bloodType.value.toString(),
      "weight": int.parse(weightController.text),
      "allergies": selectedAllergens,
      "diseases": selectedDiseases,
      "pregnant": pregnent == "YES" ? true : false,
    };

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    var dataToSend = json.encode(dataBody);

    print(dataToSend);
    print(token);

    var response = await http.post(
        Uri.parse(
            "https://hackathonbackend-production.up.railway.app/api/v1/user/basicInfo"),
        headers: header,
        body: dataToSend);

    print("status" + response.statusCode.toString());
    print("response body" + response.body);

    if (response.statusCode == 200) {
      Get.back();
      UserInfoModel userInfoModel = userInfoModelFromJson(response.body);

      // print("user info model data" + userInfoModel.data.age.toString());

      SharedPreferences prefs = await SharedPreferences.getInstance();
      //Return String
      prefs.setStringList("allergies", userInfoModel.data.allergies);
      prefs.setStringList("diseas", userInfoModel.data.diseases);

      prefs.setString("age", userInfoModel.data.age.toString()); //age
      prefs.setString("sex", userInfoModel.data.sex.toString()); //toke
      prefs.setString("height", userInfoModel.data.height.toString()); //toke
      prefs.setString("weight", userInfoModel.data.weight.toString()); //toke
      prefs.setString("blood", userInfoModel.data.bloodGroup.toString()); //toke

      prefs.setString(
          "pregnent", userInfoModel.data.pregnant.toString()); //toke
      prefs.setString("insulin", userInfoModel.data.insulin.toString()); //toke
      prefs.setString("bmi", userInfoModel.data.bmi.toString()); //toke

      Get.to(Navigation());
    } else if (response.statusCode == 401) {
      // Get.back();
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Log In Failed',
          message: 'Make sure you are  using existing email/password',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }
}
