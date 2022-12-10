import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:medica/Screens/Add%20Mesurements/add_mesurements.dart';
import 'package:medica/Screens/Add%20Mesurements/controller/add_mesurements_controllers.dart';
import 'package:medica/Screens/Home/components/common_disease_cards.dart';
import 'package:medica/Screens/Home/components/glucose.dart';
import 'package:medica/Screens/Home/components/hemoglobin_card.dart';
import 'package:medica/Screens/Home/tabs/Daily%20records/controllers/dailyrecords_controller.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/helper/components/HealthMateIllustrations.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class DailyRecords extends StatefulWidget {
  DailyRecords({super.key});

  @override
  State<DailyRecords> createState() => _DailyRecordsState();
}

class _DailyRecordsState extends State<DailyRecords> {
  List<Map<String, dynamic>> demo_data = [
    {
      "reading": "120/80",
      "status": "Normal",
      "values": [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
    },
    {
      "reading": "120/80",
      "status": "Normal",
      "values": [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
    },
    {
      "reading": "120/80",
      "status": "Normal",
      "values": [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
    },
    {
      "reading": "120/10",
      "status": "Critical",
      "values": [120 / 80, 120 / 90, 100 / 40],
    },
    {
      "reading": "120/80",
      "status": "Normal",
      "values": [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
    },
    {
      "reading": "120/80",
      "status": "Critical",
      "values": [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
    },
    {
      "reading": "120/80",
      "status": "Normal",
      "values": [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
    },
    {
      "reading": "120/80",
      "status": "Normal",
      "values": [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0],
    },
  ];

  @override
  Widget build(BuildContext context) {
    DailyRecordsController dailyRecordsController =
        Get.put(DailyRecordsController());

    return Scaffold(
      extendBody: false,
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 18.h),
        child: FloatingActionButton(
          backgroundColor: HealthMateColors.happyGreen,
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(
              AddMesurements(),
            );
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(left: 2.w),
                  height: 4.h,
                  width: 40.w,
                  child: Center(
                      child: TextField(
                    controller: dailyRecordsController
                        .dateinput, //editing controller of this TextField
                    decoration: InputDecoration(
                        // icon: Icon(Icons.calendar_today), //icon of text field
                        border: InputBorder.none,
                        // labelText: "Enter Date" //label text of field
                        suffixIcon: Icon(
                          Icons.expand_more,
                          size: 30,
                          color: HealthMateColors.shyGrey,
                        )),
                    readOnly:
                        true, //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(
                              2000), //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime.now());

                      if (pickedDate != null) {
                        print(
                            pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                        String formattedDate =
                            DateFormat('yyyy-MM-dd').format(pickedDate);
                        print(
                            formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement

                        setState(() {
                          dailyRecordsController.dateinput.text =
                              formattedDate; //set output date to TextField value.

                          dailyRecordsController.getallData();
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ))),
              IconButton(
                  onPressed: () {
                    dailyRecordsController.getallData();
                  },
                  icon: Icon(Icons.refresh))
            ],
          ),
          Container(
              height: 50.h,
              width: 100.w,
              child: dailyRecordsController.dataFrom_a_particular_date.isEmpty
                  ? Center(
                      child: OrgIllustrations(
                          title: "Nothing here yet",
                          message: "No data is tracked on " +
                              dailyRecordsController.dateinput.text,
                          imagePath: "assets/pngs/illus1.png"),
                    )
                  : ListView.builder(
                      itemCount: dailyRecordsController
                          .dataFrom_a_particular_date.length,
                      itemBuilder: ((context, index) {
                        return dailyRecordsController
                                    .dataFrom_a_particular_date[index].type ==
                                "Glucose"
                            ? GlucoseCard(
                                reading: dailyRecordsController
                                    .dataFrom_a_particular_date[index].xValue,
                              )
                            : dailyRecordsController
                                        .dataFrom_a_particular_date[index]
                                        .type ==
                                    "Hemoglobin"
                                ? HemoGlobinCard(
                                    reading: dailyRecordsController
                                        .dataFrom_a_particular_date[index]
                                        .xValue,
                                  )
                                : dailyRecordsController
                                            .dataFrom_a_particular_date[index]
                                            .type ==
                                        "BloodPreasure"
                                    ? BloodPresureCard(
                                        x_value: dailyRecordsController
                                            .dataFrom_a_particular_date[index]
                                            .xValue,
                                        y_value: dailyRecordsController
                                            .dataFrom_a_particular_date[index]
                                            .yValue,
                                      )
                                    : Container();
                      }))),
          SizedBox(
            height: 5.h,
          )
        ],
      ),
    );
  }
}
