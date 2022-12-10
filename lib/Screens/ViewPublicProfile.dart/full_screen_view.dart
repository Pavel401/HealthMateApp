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

class View extends StatefulWidget {
  const View({super.key});

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  void _showTestDialog(Visit result) {
    showDialog(
        context: context,
        barrierDismissible: true,
        //context: _scaffoldKey.currentContext,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 25, right: 25),
            title: Center(child: Text("Information")),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            content: Container(
              height: 30.h,
              width: 100.w,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
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
                                  result.reports[0].toString())),
                          color: HealthMateColors.hotGreen),
                    ),
                    Text("Problem:"),
                    Text(result.type),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text("Doctor:"),
                    Text(result.doctor),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text("Hospital:"),
                    Text(result.hospital),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text("Drugs:"),
                    Wrap(
                      spacing: 10,
                      children: [
                        for (int i = 0; i < result.drugs.length; i++)
                          Chip(
                            label: Text(
                              result.drugs[i],
                              style: context.heading1.copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 10,
                                  color: HealthMateColors.hotGreen),
                            ),
                            backgroundColor: HealthMateColors.shyGreen,
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 0.20,
                    child: OutlinedButton(
                      child: new Text(
                        'Close',
                        style: TextStyle(color: HealthMateColors.solidBlack),
                      ),
                      // color: Color(0xFF121A21),
                      // shape: new RoundedRectangleBorder(
                      //   borderRadius: new BorderRadius.circular(30.0),
                      // ),
                      onPressed: () {
                        //saveIssue();
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              )
            ],
          );
        });
  }

  PublicProfileFetchController publicProfileFetchController =
      PublicProfileFetchController();
  @override
  Widget build(BuildContext context) {
    OtpFieldController otpController = OtpFieldController();

    return Scaffold(
      body: ListView(
        children: [
          Card(
            child: Container(
              padding: EdgeInsets.only(left: 3.w, right: 3.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 3.0.h,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 2.8.h,
                          backgroundImage: CachedNetworkImageProvider(
                            "https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg",
                          ),
                        ),
                      ),
                      InkWell(
                        child: Icon(
                          Icons.edit,
                          color: HealthMateColors.shyGrey,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 24.sp,
                            width: 24.sp,
                            child: SvgPicture.asset("assets/svgs/Height.svg"),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            publicProfileFetchController.data!.basicInfo.height
                                .toString(),
                            style: context.subtitle1,
                          ),
                          Text(
                            "ft",
                            style: context.body1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 24.sp,
                            width: 24.sp,
                            child: SvgPicture.asset("assets/svgs/Weight.svg"),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            publicProfileFetchController.data!.basicInfo.weight
                                .toString(),
                            style: context.subtitle1,
                          ),
                          Text(
                            "kg",
                            style: context.body1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 24.sp,
                            width: 24.sp,
                            child: SvgPicture.asset("assets/svgs/Blood.svg"),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            publicProfileFetchController
                                .data!.basicInfo.bloodGroup,
                            style: context.subtitle1,
                          ),
                          // Text(
                          //   "+",
                          //   style: context.body1,
                          // ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
          ),

          //bottom wrap

          Card(
            child: Container(
              padding: EdgeInsets.only(left: 2.w, right: 2.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Allergies",
                        style: context.subtitle1
                            .copyWith(color: HealthMateColors.dullGrey),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                      for (int i = 0;
                          i <
                              publicProfileFetchController
                                  .data!.basicInfo.allergies.length;
                          i++)
                        Chip(
                          label: Text(
                            publicProfileFetchController
                                .data!.basicInfo.allergies[i],
                            style: context.heading1.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 10,
                                color: HealthMateColors.hotGreen),
                          ),
                          backgroundColor: HealthMateColors.shyGreen,
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Diseases",
                        style: context.subtitle1
                            .copyWith(color: HealthMateColors.dullGrey),
                      ),
                    ],
                  ),
                  Wrap(
                    spacing: 10,
                    children: [
                      for (int i = 0;
                          i <
                              publicProfileFetchController
                                  .data!.basicInfo.diseases.length;
                          i++)
                        Chip(
                          label: Text(
                            publicProfileFetchController
                                .data!.basicInfo.diseases[i],
                            style: context.heading1.copyWith(
                                fontWeight: FontWeight.w800,
                                fontSize: 10,
                                color: HealthMateColors.happyOrange),
                          ),
                          backgroundColor: HealthMateColors.shyOrange,
                          labelStyle: TextStyle(color: Colors.white),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Timeline",
                style: context.subtitle1
                    .copyWith(color: HealthMateColors.dullGrey),
              ),
            ],
          ),

          publicProfileFetchController.data!.visit.length > 0
              ? Container(
                  width: 100.w,
                  height: 50.h,
                  child: ListView.builder(
                      itemCount:
                          publicProfileFetchController.data!.visit.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            _showTestDialog(publicProfileFetchController
                                .data!.visit[index]);
                          },
                          child: VisitCard(
                            timeline:
                                publicProfileFetchController.data!.visit[index],
                          ),
                        );
                      })),
                )
              : Container(),

          SizedBox(
            height: 8.h,
          )
        ],
      ),
    );
  }
}
