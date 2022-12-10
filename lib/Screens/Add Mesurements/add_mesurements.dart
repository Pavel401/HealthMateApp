import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medica/Screens/Auth/constants.dart';
import 'package:medica/Screens/Auth/widgets/rounded_button.dart';
import 'package:medica/Screens/Auth/widgets/text_field_container.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:sizer/sizer.dart';

import 'controller/add_mesurements_controllers.dart';

class AddMesurements extends StatefulWidget {
  const AddMesurements({super.key});

  @override
  State<AddMesurements> createState() => _AddMesurementsState();
}

class _AddMesurementsState extends State<AddMesurements> {
  @override
  Widget build(BuildContext context) {
    AddMesurementsController addMesurementsController =
        Get.put(AddMesurementsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Mesurements"),
        backgroundColor: HealthMateColors.happyGreen,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        child: ListView(
          children: [
            SizedBox(
              height: 2.h,
            ),
            FadeInRight(
              child: Text(
                "Track your daily \nMeasurement ",
                textAlign: TextAlign.center,
                style: context.heading1.copyWith(
                    color: HealthMateColors.shyGrey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            FadeInRight(
              child: Text(
                "Select Mesurement Type",
                style: context.body1.copyWith(
                    color: HealthMateColors.shyGrey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FadeInRight(
              child: Obx(() => Container(
                    width: 30.w,
                    color: HealthMateColors.plainWhite,
                    child: DropdownButtonFormField(
                      focusColor: Colors.white,
                      dropdownColor: HealthMateColors.plainWhite,
                      onChanged: (newValue) {
                        addMesurementsController
                            .setSelectedType(newValue.toString());
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      value: addMesurementsController.MesurementsType.value,
                      items: addMesurementsController.MesurementsTypes.map(
                          (selectedType) {
                        return DropdownMenuItem(
                          child: new Text(
                            selectedType,
                            style: context.subtitle2.copyWith(
                                color: HealthMateColors.dullGrey,
                                fontWeight: FontWeight.bold),
                          ),
                          value: selectedType,
                        );
                      }).toList(),
                    ),
                  )),
            ),
            SizedBox(
              height: 2.h,
            ),
            FadeInRight(
              child: Text(
                "Add the correct mesurement value",
                style: context.body1.copyWith(
                    color: HealthMateColors.shyGrey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            FadeInRight(child: Obx(() {
              return TextFieldContainer(
                child: TextFormField(
                  controller: addMesurementsController.x_value,
                  cursorColor: kPrimaryColor,
                  validator: (password) {},
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.vaccines_outlined,
                        color: kPrimaryColor,
                      ),
                      hintText: addMesurementsController
                                  .MesurementsType.value ==
                              "Glucose"
                          ? "xx g/mol"
                          : addMesurementsController.MesurementsType.value ==
                                  "Hemoglobin"
                              ? "xx h/l"
                              : "120 hg",
                      hintStyle: TextStyle(fontFamily: 'OpenSans'),
                      border: InputBorder.none),
                ),
              );
            })),
            SizedBox(
              height: 2.h,
            ),
            addMesurementsController.MesurementsType.value == "BloodPreasure"
                ? FadeInRight(child: Obx(() {
                    return TextFieldContainer(
                      child: TextFormField(
                        controller: addMesurementsController.y_value,
                        cursorColor: kPrimaryColor,
                        validator: (password) {},
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.vaccines_outlined,
                              color: kPrimaryColor,
                            ),
                            hintText: addMesurementsController
                                        .MesurementsType.value ==
                                    "Glucose"
                                ? "xx g/mol"
                                : "80 hg",
                            hintStyle: TextStyle(fontFamily: 'OpenSans'),
                            border: InputBorder.none),
                      ),
                    );
                  }))
                : Container(),
            SizedBox(
              height: 2.h,
            ),
            // FadeInRight(
            //   child: Text(
            //     "Add the mesurement date",
            //     style: context.body1.copyWith(
            //         color: HealthMateColors.shyGrey,
            //         fontWeight: FontWeight.bold),
            //   ),
            // ),
            // SizedBox(
            //   height: 2.h,
            // ),
            // FadeInRight(
            //   child: Container(
            //       // padding: EdgeInsets.all(15),
            //       height: 8.h,
            //       child: Center(
            //           child: TextField(
            //         controller: addMesurementsController
            //             .dateinput, //editing controller of this TextField
            //         decoration: InputDecoration(
            //             icon: Icon(Icons.calendar_today), //icon of text field
            //             labelText: "Enter Date" //label text of field
            //             ),
            //         readOnly:
            //             true, //set it true, so that user will not able to edit text
            //         onTap: () async {
            //           DateTime? pickedDate = await showDatePicker(
            //               context: context,
            //               initialDate: DateTime.now(),
            //               firstDate: DateTime(
            //                   2000), //DateTime.now() - not to allow to choose before today.
            //               lastDate: DateTime.now());

            //           if (pickedDate != null) {
            //             print(
            //                 pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
            //             String formattedDate =
            //                 DateFormat('yyyy-MM-dd').format(pickedDate);
            //             print(
            //                 formattedDate); //formatted date output using intl package =>  2021-03-16
            //             //you can implement different kind of Date Format here according to your requirement

            //             setState(() {
            //               addMesurementsController.dateinput.text =
            //                   formattedDate; //set output date to TextField value.
            //             });
            //           } else {
            //             print("Date is not selected");
            //           }
            //         },
            //       ))),
            // ),
            FadeInUp(
                child: RoundedButton(
                    text: 'Add Data',
                    press: () {
                      addMesurementsController.sendPostDataToServer();
                    })),
          ],
        ),
      ),
    );
  }
}
