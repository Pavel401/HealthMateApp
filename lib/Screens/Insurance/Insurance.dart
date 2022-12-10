import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medica/Screens/Insurance/controller/InsuranceController.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:sizer/sizer.dart';

import 'components/InsuranceCard.dart';

class Insurance extends StatefulWidget {
  const Insurance({super.key});

  @override
  State<Insurance> createState() => _InsuranceState();
}

class _InsuranceState extends State<Insurance> {
  InsuranceController insuranceController = InsuranceController();

  @override
  void initState() {
    // TODO: implement initState
    insuranceController.getStringValuesSF();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Insurance",
          style: TextStyle(
            color: HealthMateColors.shyGrey,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: HealthMateColors.bgColor,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu, color: HealthMateColors.happyGreen)),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 2.w, right: 2.w),
        child: ListView(
          children: [
            // Text(
            //   "Insurance",
            //   style: TextStyle(
            //     color: HealthMateColors.shyGrey,
            //     fontSize: 20,
            //     fontWeight: FontWeight.w800,
            //   ),
            // ),
            Container(
                color: Colors.white,
                height: 80.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: insuranceController.InsuranceData.length,
                    itemBuilder: (context, index) {
                      return InsuranceCard(
                        result: insuranceController.InsuranceData[index],
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
