// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:medica/Screens/ViewPublicProfile.dart/ViewPublicProfile.dart';
// import 'package:medica/constants/health_mate_colors.dart';
// import 'package:medica/model/FetchPublicProfile.dart';
// import 'package:medica/model/TimelineDataFetchedModel.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;

// class PublicProfileFetchController extends GetxController {
//   TextEditingController otp = TextEditingController(text: "");

//   @override
//   void onInit() {
//     // TODO: implement onInit
//     getStringValuesSF();

//     super.onInit();
//   }

//   String? token;
//   getStringValuesSF() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return String
//     token = prefs.getString("token"); //token
//     WidgetsBinding.instance.addPostFrameCallback((_) {});
//   }

//   // List<Visit> timelines = [];
//   // late BasicInfo basicInfo;
//   //  BasicInfo(
//   //     basicId: "",
//   //     userId: "",
//   //     age: 10,
//   //     height: 100,
//   //     sex: "",
//   //     bloodGroup: "",
//   //     weight: 120,
//   //     allergies: [],
//   //     diseases: [],
//   //     pregnant: true,
//   //     bmi: 20,
//   //     insulin: 10);

//   Future<void> fetchPublicData(String otp) async {
//     // var spinkit = SpinKitPulse(
//     //   color: HealthMateColors.happyGreen,
//     //   size: 50.0,
//     // );
//     // Get.dialog(
//     //   Container(
//     //     height: 100,
//     //     width: 100,
//     //     child: Center(
//     //       child: spinkit,
//     //     ),
//     //   ),
//     //   barrierDismissible: false,
//     // );
//     // print(token);
//     // var base_url =
//     //     "https://hackathonbackend-production.up.railway.app/api/v1/user/allMeasurementOfDate/" +
//     //         ;

//     // print(base_url);
//     print(token.toString());

//     var response = await http.get(
//       Uri.parse(
//           "https://hackathonbackend-production.up.railway.app/api/v1/user/verify/" +
//               otp),
//     );

//     print("ss" + response.statusCode.toString());

//     if (response.statusCode == 200) {
//       PublicProfileFetchedModel fetchedModel =
//           PublicProfileFetchedModel.fromJson(json.decode(response.body));

//       timelines = fetchedModel.data.visit;
//       basicInfo = fetchedModel.data.basicInfo;
//       Get.forceAppUpdate();

//       Get.back();
//       Get.to(View());
//     } else if (response.statusCode == 401) {
//       Get.back();
//     }
//   }

//   //get timelines data on init state

//   // List<TimeLineResult> timelines = [];

// }
