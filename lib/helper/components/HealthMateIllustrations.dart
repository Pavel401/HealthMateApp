import 'package:flutter/material.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';

import 'package:sizer/sizer.dart';

class OrgIllustrations extends StatelessWidget {
  final String title;
  final String message;
  final String imagePath;
  const OrgIllustrations({
    Key? key,
    required this.title,
    required this.message,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: 70.w,
      decoration: BoxDecoration(color: HealthMateColors.elevatingLightYellow),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: context.caption.copyWith(color: HealthMateColors.shyGrey),
          ),
          Image.asset(imagePath),
          SizedBox(
            width: 80.w,
            child: Text(
              message,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: context.caption.copyWith(color: HealthMateColors.shyGrey),
            ),
          )
        ],
      ),
    );
  }
}
