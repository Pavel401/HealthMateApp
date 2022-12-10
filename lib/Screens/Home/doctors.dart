import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:sizer/sizer.dart';

class doctorCard extends StatefulWidget {
  final String dname;
  final String designation;

  doctorCard({
    Key? key,
    required this.dname,
    required this.designation,
  }) : super(key: key);

  @override
  State<doctorCard> createState() => doctorCardState();
}

class doctorCardState extends State<doctorCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 80.w,
      height: 14.h,
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
          Container(
            height: 14.h,
            width: 2.w,
            decoration: BoxDecoration(
              color: HealthMateColors.sexyPurple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.circle,
                    size: 70,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.dname,
                        style: context.heading2.copyWith(
                            fontSize: 14.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.designation,
                        style: context.heading2.copyWith(
                            fontSize: 12.sp, color: HealthMateColors.dullGrey),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 36.w,
                  ),
                  SvgPicture.asset(
                    "assets/svgs/three_dot.svg",
                    color: HealthMateColors.shyGrey,
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
