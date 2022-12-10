import 'package:animate_do/animate_do.dart';
import 'package:animated_button/animated_button.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medica/Screens/Auth/constants.dart';
import 'package:medica/Screens/Auth/widgets/text_field_container.dart';
import 'package:medica/Screens/Userdata/controllers/UserDataController.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:medica/helper/components/CustomStepper.dart';
import 'package:sizer/sizer.dart';
import 'package:vertical_weight_slider/vertical_weight_slider.dart';
import 'package:wheel_slider/wheel_slider.dart';

class BasicData extends StatefulWidget {
  BasicData({super.key});

  @override
  State<BasicData> createState() => _BasicDataState();
}

class _BasicDataState extends State<BasicData> {
  @override
  int age = 0;
  late WeightSliderController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller =
        WeightSliderController(initialWeight: 1, minWeight: 0, interval: 0.1);
    super.initState();
  }

  Widget build(BuildContext context) {
    UserDataController userDataController =
        Get.put(UserDataController(context: context));
    cmToInches(inchess) {
      ft = inchess ~/ 12;
      inches = inchess % 12;
      print('$ft feet and $inches inches');
    }

    inchesToCm() {
      int inchesTotal = (ft * 12) + inches;
      cm = (inchesTotal * 2.54).toStringAsPrecision(5);
      userDataController.heightController.text = cm;
    }

    void checkHeightUnit() {
      if (selectedUnit == HeightUnit.ft) {
        setState(() {
          int inchess =
              (double.parse(userDataController.heightController.text) ~/ 2.54)
                  .toInt();
          cmToInches(inchess);
          userDataController.heightController.text = '$ft\' $inches"';
        });
      } else if (selectedUnit == HeightUnit.cm) {
        setState(() {
          print(userDataController.heightController.text);
          inchesToCm();
        });
      }
    }

    return Padding(
      padding: EdgeInsets.only(left: 2.w, right: 2.w),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 8.h,
          ),
          Text(
            "Tell me more \nabout yourself",
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
              elevation: 4,
              child: Container(
                width: 85.w,
                height: 10.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    WheelSlider.number(
                      perspective: 0.01,
                      totalCount: 100,
                      initValue: 1,
                      verticalListHeight: 8.h,
                      horizontal: false,
                      unSelectedNumberStyle: context.heading3,
                      currentIndex: 1,
                      onValueChanged: (val) {
                        userDataController.ageController.text = val.toString();
                      },
                    ),
                    SizedBox(
                      width: 40.w,
                    ),
                    SizedBox(
                      width: 20.w,
                      child: Text(
                        "Your Age",
                        textAlign: TextAlign.center,
                        style: context.subtitle2.copyWith(
                            color: HealthMateColors.shyGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 2.h,
          ),
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: HealthMateColors.plainWhite,
              elevation: 4,
              child: Container(
                width: 85.w,
                height: 10.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Obx(() => Container(
                          width: 30.w,
                          color: HealthMateColors.plainWhite,
                          child: DropdownButtonFormField(
                            focusColor: Colors.white,
                            dropdownColor: HealthMateColors.plainWhite,
                            onChanged: (newValue) {
                              userDataController
                                  .setSelected(newValue.toString());
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            value: userDataController.Gender.value,
                            items: userDataController.dropdownText
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
                    SizedBox(
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 25.w,
                      child: Text(
                        "Your Gender",
                        textAlign: TextAlign.center,
                        style: context.subtitle2.copyWith(
                            color: HealthMateColors.shyGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 2.h,
          ),
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: HealthMateColors.plainWhite,
              elevation: 4,
              child: Container(
                width: 85.w,
                height: 10.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Obx(() => Container(
                          width: 30.w,
                          color: HealthMateColors.plainWhite,
                          child: DropdownButtonFormField(
                            focusColor: Colors.white,
                            dropdownColor: HealthMateColors.plainWhite,
                            onChanged: (newValue) {
                              userDataController
                                  .setPregnet(newValue.toString());
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            value: userDataController.pregnent.value,
                            items:
                                userDataController.pregents.map((selectedType) {
                              return DropdownMenuItem(
                                child: new Text(
                                  selectedType,
                                ),
                                value: selectedType,
                              );
                            }).toList(),
                          ),
                        )),
                    SizedBox(
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 25.w,
                      child: Text(
                        "Pregnent ?",
                        textAlign: TextAlign.center,
                        style: context.subtitle2.copyWith(
                            color: HealthMateColors.shyGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 2.h,
          ),
          Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: HealthMateColors.plainWhite,
              elevation: 4,
              child: Container(
                width: 85.w,
                height: 10.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Obx(() => Container(
                          width: 30.w,
                          color: HealthMateColors.plainWhite,
                          child: DropdownButtonFormField(
                            focusColor: Colors.white,
                            dropdownColor: HealthMateColors.plainWhite,
                            onChanged: (newValue) {
                              userDataController
                                  .setInsulin(newValue.toString());
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            value: userDataController.insulin.value,
                            items:
                                userDataController.insulins.map((selectedType) {
                              return DropdownMenuItem(
                                child: new Text(
                                  selectedType,
                                ),
                                value: selectedType,
                              );
                            }).toList(),
                          ),
                        )),
                    SizedBox(
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 25.w,
                      child: Text(
                        "Insulin ?",
                        textAlign: TextAlign.center,
                        style: context.subtitle2.copyWith(
                            color: HealthMateColors.shyGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )),
          SizedBox(
            height: 2.h,
          ),
          TextFieldContainer(
            child: TextFormField(
              controller: userDataController.heightController,
              cursorColor: kPrimaryColor,
              validator: (password) {},
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.vaccines_outlined,
                    color: kPrimaryColor,
                  ),
                  hintText: "120 cm",
                  hintStyle: TextStyle(fontFamily: 'OpenSans'),
                  border: InputBorder.none),
            ),
          ),
          SizedBox(
            height: 4.h,
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
                    if (userDataController.ageController.text.isEmpty ||
                        userDataController.Gender.isEmpty ||
                        userDataController.heightController.text.isEmpty) {
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
                      ProgressStepperState.nextPage();
                    }
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  HeightUnit selectedUnit = HeightUnit.ft;
  int ft = 0;
  int inches = 0;
  late String cm;
}

enum HeightUnit { ft, cm }
