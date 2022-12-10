import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:sizer/sizer.dart';

class BloodPresureCard extends StatefulWidget {
  final String x_value;
  final String y_value;

  // final List<double> values;
  BloodPresureCard({
    Key? key,
    required this.x_value,
    required this.y_value,
    // required this.values,
  }) : super(key: key);

  @override
  State<BloodPresureCard> createState() => _BloodPresureCardState();
}

class _BloodPresureCardState extends State<BloodPresureCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 80.w,
      height: 15.h,
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
            height: 15.h,
            width: 2.w,
            decoration: BoxDecoration(
                color: (double.parse(widget.x_value) /
                            double.parse(widget.y_value)) >
                        (90 / 60)
                    ? HealthMateColors.happyOrange
                    : HealthMateColors.happyGreen,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
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
                    "Blood Pressure",
                    style: context.heading1,
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  SvgPicture.asset("assets/svgs/BloodPreasure.svg",
                      color: HealthMateColors.shyGrey,
                      semanticsLabel: 'A red up arrow'),
                  SizedBox(
                    width: 4.w,
                  ),
                  // widget.status == "Critical"
                  //     ? SvgPicture.asset("assets/svgs/Danger.svg",
                  //         color: HealthMateColors.happyOrange,
                  //         semanticsLabel: 'A red up arrow')
                  //     : Container(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.x_value + "/" + widget.y_value,
                        style: context.heading1.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "mmhg",
                        style: context.heading1.copyWith(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 33.w,
                  ),
                  // Container(
                  //   width: 10.w,
                  //   height: 5.h,
                  //   child: Sparkline(
                  //     data: widget.reading,
                  //     lineColor: widget.status == "Critical"
                  //         ? HealthMateColors.happyOrange
                  //         : HealthMateColors.happyGreen,
                  //   ),
                  // // ),
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
                    "90/60",
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
