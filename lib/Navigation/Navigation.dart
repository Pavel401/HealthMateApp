import 'dart:io';

import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:medica/Onboarding/Components/OnboardingBody.dart';
import 'package:medica/Onboarding/Onboarding.dart';
import 'package:medica/Screens/Home/home.dart';
import 'package:medica/Screens/Insurance/Insurance.dart';
import 'package:medica/Screens/Profile/Profile.dart';
import 'package:medica/Screens/ShareProfile/ShareProfile.dart';
import 'package:medica/Screens/ViewPublicProfile.dart/ViewPublicProfile.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/donations/donations.dart';
import 'package:medica/main.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'controller/drawer_controller.dart';
import 'controller/navbar_controller.dart';

class Navigation extends StatefulWidget {
  Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  final bottomNavigationBarController landingPageController =
      Get.put(bottomNavigationBarController(), permanent: false);

  final dController dControllers = Get.put(dController(), permanent: false);
  String? usn;
  String? name;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   getStringValuesSF();

  //   super.initState();
  // }

  // getStringValuesSF() async {
  //   SharedPreferences prefs =
  //       await SharedPreferences.getInstance(); //Return String
  //   usn = prefs.getString("usn");
  //   name = prefs.getString("name");

  //   // print("token is" + stringValue.toString());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        key: dControllers.key,
        drawer: Drawer(
          // backgroundColor: AppColors.primaryColor,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                // <-- SEE HERE

                decoration: BoxDecoration(color: HealthMateColors.happyGreen),
                accountName: Text(
                  name == "null" ? name.toString() : "Welcome",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                accountEmail: Text(
                  usn == "null" ? usn.toString() : "To HealthMate",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: FlutterLogo(),
              ),
              ListTile(
                leading: Icon(
                  Icons.home_outlined,
                  color: HealthMateColors.shyGrey,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HealthMateColors.shyGrey,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.privacy_tip_outlined,
                  color: HealthMateColors.shyGrey,
                ),
                title: Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HealthMateColors.shyGrey,
                  ),
                ),
                // onTap: () {
                //   Get.to(AboutUs());
                // },
              ),
              ListTile(
                leading: Icon(
                  Icons.share_outlined,
                  color: HealthMateColors.shyGrey,
                ),
                title: Text(
                  'Share Public Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HealthMateColors.shyGrey,
                  ),
                ),
                onTap: () async {
                  Get.to(ShareProfile());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.radar,
                  color: HealthMateColors.shyGrey,
                ),
                title: Text(
                  'View Public Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HealthMateColors.shyGrey,
                  ),
                ),
                onTap: () async {
                  Get.to(ViewPublicProfile());
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: HealthMateColors.shyGrey,
                ),
                title: Text(
                  'Exit',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HealthMateColors.shyGrey,
                  ),
                ),
                onTap: () async {
                  // final preferences = await SharedPreferences.getInstance();
                  // await preferences.clear();

                  // print('Confirmed');
                  // Get.to(MyApp());
                  exit(0);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => Padding(
            padding: EdgeInsets.only(bottom: 2.h),
            child: CustomNavigationBar(
              elevation: 10,
              isFloating: true,
              iconSize: 30.0,
              borderRadius: Radius.circular(12),
              selectedColor: HealthMateColors.happyGreen,
              strokeColor: Color(0x30040307),
              unSelectedColor: HealthMateColors.solidBlack.withOpacity(0.50),
              backgroundColor: HealthMateColors.plainWhite,
              items: [
                CustomNavigationBarItem(
                  icon: const HeroIcon(HeroIcons.home),
                ),
                CustomNavigationBarItem(
                  icon: const HeroIcon(HeroIcons.userCircle),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.health_and_safety_outlined),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.volunteer_activism_outlined),
                ),
              ],
              currentIndex: landingPageController.tabIndex.value,
              onTap: landingPageController.changeTabIndex,
            ),
          ),
        ),
        body: SafeArea(
          maintainBottomViewPadding: true,
          child: Obx(
            () => IndexedStack(
              index: landingPageController.tabIndex.value,
              children: [
                Home(),
                Profile(),
                Insurance(),
                Donations(),
              ],
            ),
          ),
        ));
  }

  Future<void> showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: HealthMateColors.bgColor,
          title: Text('Do you want to logout?'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('By loging out all your on device data will be lost'),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                final preferences = await SharedPreferences.getInstance();
                await preferences.clear();

                print('Confirmed');
                Navigator.of(context).pop();
                Get.to(MyApp());
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
