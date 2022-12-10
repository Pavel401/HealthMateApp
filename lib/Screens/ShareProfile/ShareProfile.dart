import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sizer/sizer.dart';

import 'controller/shareProfilecontroller.dart';

class ShareProfile extends StatelessWidget {
  const ShareProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // OtpFieldController otpController = OtpFieldController();
    ShareProfileController shareProfileController = Get.put(
      ShareProfileController(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Share Profile",
          style: context.heading1.copyWith(
            color: HealthMateColors.plainWhite,
          ),
        ),
        backgroundColor: HealthMateColors.happyGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            Text(
              "Share the below code with whom you want to share your profile",
              style: context.subtitle1,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: 100.w,
                height: 18.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Code: ",
                      style: context.subtitle1,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      shareProfileController.otp,
                      style: context.heading1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () async {
                              await Clipboard.setData(ClipboardData(
                                  text: shareProfileController.otp));
                            },
                            icon: Icon(Icons.copy)),
                        IconButton(
                            onPressed: () {
                              Share.share(
                                  'Hi there, I am sharing my profile with you. Please use the Code: ${shareProfileController.otp} to view my profile.',
                                  subject: '${shareProfileController.otp}');
                            },
                            icon: Icon(Icons.share))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
