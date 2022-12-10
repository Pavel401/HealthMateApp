import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:medica/Navigation/Navigation.dart';
import 'package:medica/Screens/Auth/screens/signup_screen.dart';
import 'package:medica/Screens/Home/home.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'Screens/Userdata/UserdataHome.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    getStringValuesSF();
    super.initState();
  }

  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String? stringValue = prefs.getString("token"); //token

    print("token is" + stringValue.toString());

    if (stringValue == null) {
      Get.offAll(
        () => SignUpScreen(),
      );
    } else {
      Get.offAll(
        () => Navigation(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'HealthMate',
          theme: HealthMateThemes.userTheme,
          home: const Main(),
        );
      },
    );
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HealthMateColors.plainWhite,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
