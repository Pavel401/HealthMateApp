import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:sizer/sizer.dart';

class HemoGlobinCard extends StatefulWidget {
  final String reading;

  HemoGlobinCard({
    Key? key,
    required this.reading,
  }) : super(key: key);

  @override
  State<HemoGlobinCard> createState() => HemoGlobinCardState();
}

class HemoGlobinCardState extends State<HemoGlobinCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 80.w,
      height: 18.h,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: HealthMateColors.plainWhite,
        boxShadow: [
          BoxShadow(
            color: HealthMateColors.shyGrey,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 18.h,
            width: 2.w,
            decoration: BoxDecoration(
              color: int.parse(widget.reading) > 160
                  ? HealthMateColors.happyOrange
                  : HealthMateColors.happyGreen,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
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
                    width: 2.w,
                  ),
                  Text(
                    "Hemoglobin",
                    style: context.heading1,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SvgPicture.asset(
                    "assets/svgs/BloodPreasure.svg",
                    color: HealthMateColors.shyGrey,
                    semanticsLabel: 'A red up arrow',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  // widget.status == 'Critical'
                  //     ? SvgPicture.asset("assets/svgs/Danger.svg",
                  //         color: HealthMateColors.happyOrange,
                  //         semanticsLabel: 'A red up arrow')
                  //     : Container(),
                  // Text(
                  //   widget.status,
                  //   style: context.heading1.copyWith(
                  //       fontSize: 10.sp,
                  //       color: widget.status == "Critical"
                  //           ? HealthMateColors.happyOrange
                  //           : HealthMateColors.hotGreen),
                  // ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    widget.reading,
                    style: context.heading1
                        .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "h/l",
                    style: context.heading1
                        .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 28.w,
                  ),
                  // Container(
                  //   width: 10.w,
                  //   height: 5.h,
                  //   child: Sparkline(
                  //     data: reading.toString(),
                  //     lineColor: widget.status == "Critical"
                  //         ? HealthMateColors.happyOrange
                  //         : HealthMateColors.happyGreen,
                  //   ),
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "min",
                    style: context.heading1.copyWith(
                        fontSize: 15, color: HealthMateColors.dullGrey),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "120",
                    style: context.heading1.copyWith(
                        fontSize: 15, color: HealthMateColors.dullGrey),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    "max",
                    style: context.heading1.copyWith(
                        fontSize: 15, color: HealthMateColors.dullGrey),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "160",
                    style: context.heading1.copyWith(
                        fontSize: 15, color: HealthMateColors.dullGrey),
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
