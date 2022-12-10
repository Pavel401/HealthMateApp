import 'dart:convert';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:medica/Navigation/Navigation.dart';
import 'package:medica/Screens/Auth/screens/login_screen.dart';
import 'package:medica/Screens/Home/home.dart';
import 'package:medica/Screens/Userdata/UserdataHome.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:http/http.dart' as http;
import 'package:medica/model/LogInModel.dart';
import 'package:medica/model/SignUpModel.dart';
import 'package:medica/model/UserInfoModel.dart';
import 'package:medica/repository/base_url.dart';
import 'package:medica/repository/end_points.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  AuthController({required this.context});

  final sinUpKey = GlobalKey<FormState>();
  final logInKey = GlobalKey<FormState>();
  late BuildContext context;
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController usernameController = TextEditingController(text: "");
  TextEditingController phonenoController = TextEditingController(text: "");

  void signup(String username, String password) {
    if (username.isEmpty || password.isEmpty || username.isEmpty) {
      Get.snackbar("Error", "Please fill all the fields");
    } else {
      sendUserDataToServer();
    }
  }

  void login(String username, String password) {
    if (username.isEmpty || password.isEmpty || username.isEmpty) {
      Get.snackbar("Error", "Please fill all the fields");
    } else {
      sendloginData();
    }
  }

  Future<void> sendUserDataToServer() async {
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

    Map<String, String> dataBody = {
      "name": usernameController.text.toString(),
      "email": emailController.text.toString(),
      "password": passwordController.text.toString(),
      "phone": phonenoController.text.toString(),
      "user_type": "normal"
    };
    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var dataToSend = json.encode(dataBody);

    print(dataToSend);

    var response = await http.post(
        Uri.parse(BaseUrl.baseUrl + SignUpEndPoints.signUp),
        headers: header,
        body: dataToSend);

    if (response.statusCode == 200) {
      SignUpModel signUpModel = signUpModelFromJson(response.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", signUpModel.data.toString());
      Get.back();
      Get.to(UserData());
    } else if (response.statusCode == 500) {
      Get.back();
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'Sign Up Failed',
          message: 'Make sure you are not using existing email/phone number',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.failure,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    }
  }

//login

  Future<void> sendloginData() async {
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

    Map<String, String> dataBody = {
      "email": emailController.text.toString(),
      "password": passwordController.text.toString(),
    };
    const Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    var dataToSend = json.encode(dataBody);

    print(dataToSend);

    var response = await http.post(
        Uri.parse(BaseUrl.baseUrl + LoginEndPoints.login),
        headers: header,
        body: dataToSend);

    // print("status" + response.statusCode.toString());

    if (response.statusCode == 200) {
      Get.back();
      LogInModel logInModel = logInModelFromJson(response.body);

      //store the token for future use
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("token", logInModel.data.toString());
      getBasicInfoFromLogin(logInModel.data.toString());
      //get to the home page
      // Get.to(Navigation());
      final snackBar = SnackBar(
        /// need to set following properties for best effect of awesome_snackbar_content
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: AwesomeSnackbarContent(
          title: 'You are loged in',
          message: '',

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: ContentType.success,
        ),
      );

      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(snackBar);
    } else if (response.statusCode == 401) {
      Get.back();
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

  Future<void> getBasicInfoFromLogin(String token) async {
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
    // var bmi = (703 * double.parse(weightController.text)) /
    //     pow(double.parse(heightController.text) * 12, 2);
    // print(token);
    // Map<String, dynamic> dataBody = {
    //   "age": int.parse(ageController.text),
    //   "height": 180,
    //   "sex": Gender.toString() == "Male" ? "M" : "F",
    //   "blood_group": blood.value.toString() + bloodType.value.toString(),
    //   "weight": int.parse(weightController.text),
    //   "allergies": selectedAllergens,
    //   "diseases": selectedDiseases,
    //   "pregnant": pregnent == "YES" ? true : false,
    // };

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // var dataToSend = json.encode(dataBody);

    // print(dataToSend);
    print(token);

    var response = await http.get(
      Uri.parse(
          "https://hackathonbackend-production.up.railway.app/api/v1/user/basicInfo"),
      headers: header,
    );

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
      Get.back();
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
