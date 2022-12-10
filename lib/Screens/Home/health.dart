import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:sizer/sizer.dart';

class HealthCard extends StatefulWidget {
  final String name;
  final String age;
  final String height;
  final String weight;
  final String BloodG;

  HealthCard({
    Key? key,
    required this.name,
    required this.age,
    required this.height,
    required this.weight,
    required this.BloodG,
  }) : super(key: key);

  @override
  State<HealthCard> createState() => HealthCardState();
}

class HealthCardState extends State<HealthCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 85.w,
      height: 16.h,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: HealthMateColors.plainWhite,
        boxShadow: [
          BoxShadow(
            color: HealthMateColors.shyGrey,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Icon(
                    Icons.circle,
                    size: 75,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: context.heading2.copyWith(
                            fontSize: 12.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.age,
                        style: context.heading2.copyWith(
                            fontSize: 10.sp, color: HealthMateColors.dullGrey),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 38.w,
                  ),
                  SvgPicture.asset(
                    "assets/svgs/pencil.svg",
                    color: HealthMateColors.shyGrey,
                  )
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/settings_accessibility.svg",
                      color: HealthMateColors.dullGrey,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      widget.height,
                      style: context.heading3.copyWith(fontSize: 9.sp),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    SvgPicture.asset(
                      "assets/svgs/scale.svg",
                      color: HealthMateColors.dullGrey,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(
                      widget.weight,
                      style: context.heading3.copyWith(fontSize: 9.sp),
                    ),
                    SizedBox(
                      width: 18.w,
                    ),
                    Icon(
                      Icons.bloodtype,
                      color: HealthMateColors.dullGrey,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      widget.BloodG,
                      style: context.heading3.copyWith(fontSize: 9.sp),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
