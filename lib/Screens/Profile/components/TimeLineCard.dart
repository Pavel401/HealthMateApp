import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:medica/model/TimelineDataFetchedModel.dart';
import 'package:sizer/sizer.dart';

class TimeLineCard extends StatelessWidget {
  TimeLineResult timeline;
  TimeLineCard({super.key, required this.timeline});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 80.w,
      height: 30.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: HealthMateColors.dullGrey),
          boxShadow: [
            BoxShadow(
              color: HealthMateColors.dullGrey,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
          color: HealthMateColors.plainWhite),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 18.h,
            width: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                        timeline.reports[0].toString())),
                color: HealthMateColors.hotGreen),
          ),
          SizedBox(
            height: 1.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.w, right: 2.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 50.w,
                  child: Text(
                    timeline.type.toString(),
                    style: context.heading2.copyWith(
                        color: HealthMateColors.shyGrey,
                        fontWeight: FontWeight.w800),
                  ),
                ),
                Text(
                  DateFormat('yyyy-MM-dd').format(timeline.timestamp),
                  style: context.subtitle1.copyWith(
                    color: HealthMateColors.shyGrey,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: Text(
              timeline.doctor.toString(),
              style: context.subtitle1.copyWith(
                  color: HealthMateColors.shyGrey, fontWeight: FontWeight.w800),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.w),
            child: Text(
              timeline.hospital.toString(),
              style: context.subtitle1.copyWith(
                  color: HealthMateColors.shyGrey, fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }
}
