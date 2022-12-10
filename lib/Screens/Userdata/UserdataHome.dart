import 'package:flutter/material.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/helper/components/CustomStepper.dart';

import 'Screens/BasicData.dart';
import 'Screens/MedicalData.dart';
import 'Screens/TakeChipsInput.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: HealthMateColors.bgColor,
        body: ProgressStepper(
          steps: [
            ProgressStepWidget(
              title: "Basic Data",
              widget: BasicData(),
              isValid: true,
              ProgressStepWidgetIndex: '1',
            ),
            ProgressStepWidget(
              title: "Medical \n Data",
              ProgressStepWidgetIndex: '2',
              widget: MedicalData(),
              isValid: true,
            ),
            ProgressStepWidget(
              title: "Add \n dieases ",
              ProgressStepWidgetIndex: '3',
              widget: TakeChipsInput(),
              isValid: true,
            ),
          ],
          selectedColor: HealthMateColors.solidBlack,
          unSelectedColor: HealthMateColors.solidBlack,
          //  selectedOuterCircleColor: const Color(0xFF40A8F4),
          ProgressStepperType: Type.TOP,
          circleRadius: 24,
          onDone: () {
            print("completed");
          },
          textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            decoration: null,
          ),
          btnTextColor: Colors.red,
        ));
  }
}
