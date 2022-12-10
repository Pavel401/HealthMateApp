import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medica/Screens/Auth/constants.dart';
import 'package:medica/Screens/Auth/widgets/rounded_button.dart';
import 'package:medica/Screens/Auth/widgets/text_field_container.dart';
import 'package:medica/Screens/Profile/components/TimeLineCard.dart';
import 'package:medica/Screens/ViewPublicProfile.dart/components/PublicProfileCard.dart';
import 'package:medica/Screens/ViewPublicProfile.dart/controller/PublicProfileController.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:medica/model/FetchPublicProfile.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sizer/sizer.dart';

class ViewPublicProfile extends StatefulWidget {
  const ViewPublicProfile({super.key});

  @override
  State<ViewPublicProfile> createState() => _ViewPublicProfileState();
}

class _ViewPublicProfileState extends State<ViewPublicProfile> {
  @override
  Widget build(BuildContext context) {
    PublicProfileFetchController publicProfileFetchController =
        PublicProfileFetchController();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Public Profile",
          style: context.heading1.copyWith(
            color: HealthMateColors.plainWhite,
          ),
        ),
        backgroundColor: HealthMateColors.happyGreen,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 2.w,
          right: 2.w,
        ),
        child: ListView(
          children: [
            Card(
              child: Container(
                child: Column(
                  children: [
                    FadeInRight(
                      child: TextFormField(
                        controller: publicProfileFetchController.otp,
                        cursorColor: kPrimaryColor,
                        validator: (password) {},
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.password,
                              color: kPrimaryColor,
                            ),
                            hintText: "x x x x",
                            hintStyle: TextStyle(fontFamily: 'OpenSans'),
                            border: InputBorder.none),
                      ),
                    ),
                    FadeInUp(
                        child: RoundedButton(
                            text: 'Get Data',
                            press: () {
                              publicProfileFetchController.fetchPublicData(
                                  publicProfileFetchController.otp.text
                                      .toString());
                            })),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
