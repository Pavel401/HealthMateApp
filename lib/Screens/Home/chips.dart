import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:sizer/sizer.dart';

class HealthChips extends StatelessWidget {
  const HealthChips({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 85.w,
      height: 30.h,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: HealthMateColors.solidBlack),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 4.w,
                  ),
                  Text(
                    "Allergy",
                    style: context.heading2.copyWith(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: HealthMateColors.dullGrey),
                  ),
                  SizedBox(
                    width: 68.w,
                  ),
                  SvgPicture.asset(
                    "assets/svgs/pencil.svg",
                    color: HealthMateColors.shyGrey,
                  ),
                ],
              ),
              SizedBox(
                width: 4.w,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Chip(
                    elevation: 2,
                    // padding: EdgeInsets.all(2),
                    backgroundColor: Colors.greenAccent[100],
                    shadowColor: Colors.black,
                    label: Text(
                      'Casien',
                      style: TextStyle(fontSize: 20),
                    ), //Text
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
