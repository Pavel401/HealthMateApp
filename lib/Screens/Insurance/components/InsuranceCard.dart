import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:medica/model/GetInsuranceData.dart';
import 'package:sizer/sizer.dart';
import 'package:text_scroll/text_scroll.dart';

class InsuranceCard extends StatefulWidget {
  InsuranceCard({
    super.key,
    required this.result,
  });
  // String Insurance_name = "Neuro Ultiate Premium";
  // String Settlement_ratio = "80%";
  // String Interest_rate = "10%";
  // String checkup = "Free checkup";
  // String room = "Free room";
  Result result;

  @override
  State<InsuranceCard> createState() => _InsuranceCardState();
}

class _InsuranceCardState extends State<InsuranceCard> {
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [
      HexColor("#B8E8FC"),
      HexColor("#C8FFD4"),
      HexColor("#FF9494"),
      HexColor("#94B3FD"),
      HexColor("#CAF7E3"),
      HexColor("#FFD694"),
      HexColor("#FF94C4"),
      HexColor("#94FDFD"),
      HexColor("#FF94B3"),
      HexColor("#F6DFEB"),
    ];
    Color shuffleed_color = (colors..shuffle()).first;

    return Container(
      height: 25.h,
      width: 80.w,
      margin: EdgeInsets.only(bottom: 3.h),
      decoration: BoxDecoration(
          color: shuffleed_color, borderRadius: BorderRadius.circular(20)),
      padding: EdgeInsets.only(top: 1.h, right: 4.w, left: 4.w, bottom: 2.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 60.w,
                child: Text(
                  widget.result.name,
                  maxLines: 1,
                  style: context.heading1.copyWith(
                      // fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: HealthMateColors.shyGrey),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Settlement ratio",
                style: context.subtitle2.copyWith(
                    fontWeight: FontWeight.bold,
                    color: HealthMateColors.shyGrey),
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                "Interest rate",
                style: context.subtitle2.copyWith(
                    fontWeight: FontWeight.bold,
                    color: HealthMateColors.shyGrey),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                widget.result.claimSettlementRatio,
                style: context.heading4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: HealthMateColors.shyGrey),
              ),
              SizedBox(
                width: 27.w,
              ),
              Text(
                widget.result.noClaimBonus,
                style: context.heading4.copyWith(
                    fontWeight: FontWeight.bold,
                    color: HealthMateColors.shyGrey),
              )
            ],
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Chip(
                label: SizedBox(
                  width: 20.w,
                  child: Text(
                    widget.result.roomRent,
                    maxLines: 1,
                    style: context.heading3.copyWith(
                        // fontSize: 10,
                        // fontWeight: FontWeight.w800,
                        color: HealthMateColors.shyGrey),
                  ),
                ),
                backgroundColor: HealthMateColors.dryGreen,
              ),
              SizedBox(
                width: 2.w,
              ),
              Chip(
                label: TextScroll(
                  widget.result.healthCheckUp,
                  intervalSpaces: 10,
                  velocity: Velocity(pixelsPerSecond: Offset(50, 0)),
                  style: context.heading3.copyWith(
                      // fontSize: 10,
                      // fontWeight: FontWeight.w800,
                      color: HealthMateColors.shyGrey),
                  textAlign: TextAlign.right,
                  selectable: true,
                ),
                backgroundColor: HealthMateColors.dryGreen,
              ),
              SizedBox(
                width: 4.w,
              ),
              Container(
                  height: 5.h,
                  width: 10.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HealthMateColors.shyGrey,
                  ),
                  child: Icon(
                    Icons.chevron_right_rounded,
                    color: HealthMateColors.plainWhite,
                    size: 20,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
