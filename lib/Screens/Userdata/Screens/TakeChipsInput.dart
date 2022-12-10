import 'package:animated_button/animated_button.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medica/Screens/Userdata/controllers/UserDataController.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:medica/helper/components/CustomStepper.dart';
import 'package:sizer/sizer.dart';

class TakeChipsInput extends StatefulWidget {
  TakeChipsInput({super.key});

  @override
  State<TakeChipsInput> createState() => _TakeChipsInputState();
}

class _TakeChipsInputState extends State<TakeChipsInput> {
  @override
  Widget build(BuildContext context) {
    UserDataController userDataController =
        Get.put(UserDataController(context: context));

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.only(left: 4.w, right: 4.w),
          child: Column(
            children: [
              Text("Let us know about your diseases", style: context.heading1),
              Wrap(
                spacing: 10,
                children: userDataController.diseases
                    .map((e) => Obx(() {
                          return ChoiceChip(
                            label: Text(
                              e,
                              style: context.heading1.copyWith(
                                  fontSize: 10,
                                  color: HealthMateColors.plainWhite),
                            ),
                            selected:
                                userDataController.selectedDiseases.contains(e),
                            selectedColor: HealthMateColors.shyOrange,
                            onSelected: (bool selected) {
                              userDataController.selectedDiseases.contains(e)
                                  ? userDataController.selectedDiseases
                                      .remove(e)
                                  : userDataController.selectedDiseases.add(e);

                              print(userDataController.selectedDiseases);
                            },
                            backgroundColor: HealthMateColors.happyOrange,
                            labelStyle: TextStyle(color: Colors.white),
                          );
                        }))
                    .toList(),
              ),
              SizedBox(
                height: 4.h,
              ),
              Text("Let us know about your allergies", style: context.heading1),
              Wrap(
                spacing: 10,
                children: userDataController.allergens
                    .map((e) => Obx(() {
                          return ChoiceChip(
                            label: Text(
                              e,
                              style: context.heading1.copyWith(
                                  fontSize: 10,
                                  color: HealthMateColors.shyGreen),
                            ),
                            selected: userDataController.selectedAllergens
                                .contains(e),
                            selectedColor:
                                HealthMateColors.hotGreen.withOpacity(0.5),
                            onSelected: (bool selected) {
                              userDataController.selectedAllergens.contains(e)
                                  ? userDataController.selectedAllergens
                                      .remove(e)
                                  : userDataController.selectedAllergens.add(e);

                              print(userDataController.selectedAllergens);
                            },
                            backgroundColor: HealthMateColors.happyGreen,
                            labelStyle: TextStyle(color: Colors.white),
                          );
                        }))
                    .toList(),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
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
                        'Done',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (userDataController.selectedDiseases.isEmpty ||
                          userDataController.selectedAllergens.isEmpty) {
                        final snackBar = SnackBar(
                          /// need to set following properties for best effect of awesome_snackbar_content
                          elevation: 0,
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          content: AwesomeSnackbarContent(
                            title: 'On No!',
                            message:
                                'Please select atleast one disease and allergen to continue',

                            /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                            contentType: ContentType.failure,
                          ),
                        );

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(snackBar);
                      } else {
                        userDataController.checkBeforePost();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
