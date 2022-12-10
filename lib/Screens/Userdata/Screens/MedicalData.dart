import 'package:animated_button/animated_button.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:medica/Screens/Userdata/controllers/UserDataController.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:medica/helper/components/CustomStepper.dart';
import 'package:sizer/sizer.dart';
import 'package:wheel_slider/wheel_slider.dart';

class MedicalData extends StatelessWidget {
  MedicalData({super.key});

  @override
  Widget build(BuildContext context) {
    UserDataController userDataController =
        Get.put(UserDataController(context: context));

    return Column(
      children: [
        SizedBox(
          height: 8.h,
        ),
        Text(
          "Please select your \n medical details",
          textAlign: TextAlign.center,
          style: context.heading1.copyWith(
              color: HealthMateColors.shyGrey, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8.h,
        ),
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            color: HealthMateColors.plainWhite,
            elevation: 4,
            child: Container(
              width: 85.w,
              height: 16.h,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Obx(() => Container(
                            width: 20.w,
                            color: HealthMateColors.plainWhite,
                            child: DropdownButtonFormField(
                              focusColor: Colors.white,
                              dropdownColor: HealthMateColors.plainWhite,
                              onChanged: (newValue) {
                                userDataController
                                    .setBlood(newValue.toString());
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              value: userDataController.blood.value,
                              items: userDataController.bloodGroup
                                  .map((selectedType) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    selectedType,
                                  ),
                                  value: selectedType,
                                );
                              }).toList(),
                            ),
                          )),
                      Obx(() => Container(
                            width: 20.w,
                            color: HealthMateColors.plainWhite,
                            child: DropdownButtonFormField(
                              focusColor: Colors.white,
                              dropdownColor: HealthMateColors.plainWhite,
                              onChanged: (newValue) {
                                userDataController
                                    .setBloodType(newValue.toString());
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                              value: userDataController.bloodType.value,
                              items: userDataController.bloodTypes
                                  .map((selectedType) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    selectedType,
                                  ),
                                  value: selectedType,
                                );
                              }).toList(),
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 25.w,
                    child: Text(
                      "Your Blood Group",
                      textAlign: TextAlign.center,
                      style: context.subtitle2.copyWith(
                          color: HealthMateColors.shyGrey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            )),
        SizedBox(
          height: 5.h,
        ),
        Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 4,
            child: Container(
              width: 85.w,
              height: 12.h,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 60.w,
                        child: WheelSlider.number(
                          perspective: 0.01,
                          totalCount: 200,
                          initValue: 1,
                          // verticalListHeight: 8.h,
                          // horizontal: false,
                          unSelectedNumberStyle: context.heading3,
                          currentIndex: 1,
                          onValueChanged: (val) {
                            userDataController.weightController.text =
                                val.toString();
                            userDataController.weight.value = val;
                            //  print(userDataController.ageController.text);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 30.w,
                    child: Text(
                      "Your Weight",
                      textAlign: TextAlign.center,
                      style: context.subtitle2.copyWith(
                          color: HealthMateColors.shyGrey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                      width: 30.w,
                      child: Obx(
                        () => Text(
                          userDataController.weight.toString() + " Kg",
                          textAlign: TextAlign.center,
                          style: context.subtitle2.copyWith(
                              color: HealthMateColors.shyGrey,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ],
              ),
            )),
        SizedBox(
          height: 5.h,
        ),
        Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedButton(
                color: HealthMateColors.happyOrange,
                width: 30.w,
                height: 6.h,
                child: Center(
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onPressed: () {
                  ProgressStepperState.goToPreviousPage();
                },
              ),
              AnimatedButton(
                color: HealthMateColors.happyGreen,
                width: 30.w,
                height: 6.h,
                child: Center(
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                onPressed: () {
                  if (userDataController.blood.value.isEmpty ||
                      userDataController.bloodType.value.isEmpty ||
                      userDataController.weight.toString() == "0") {
                    final snackBar = SnackBar(
                      /// need to set following properties for best effect of awesome_snackbar_content
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'On No!',
                        message: 'Please fill all the fields to continue',

                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        contentType: ContentType.failure,
                      ),
                    );

                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  } else {
                    print(userDataController.weightController.text);

                    ProgressStepperState.nextPage();
                  }
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
