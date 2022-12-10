import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/Screens/Profile/components/TimeLineCard.dart';
import 'package:medica/Screens/Profile/sub%20pages/controller/addTimelineController.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:medica/model/TimelineDataFetchedModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'sub pages/AddTimeline.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void initState() {
    // TODO: implement initState
    getuserdata();
    super.initState();
  }

  String? gender;
  String? height;
  String? weight;

  String? blood;
  String? age;
  List<String> allergens = [];
  List<String> diseases = [];

  getuserdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      gender = prefs.getString("sex"); //toke
      age = prefs.getString("age"); //age
      allergens = prefs.getStringList("allergies")!;
      diseases = prefs.getStringList("diseas")!;
      height = prefs.getString("height"); //toke
      weight = prefs.getString("weight"); //toke
      blood = prefs.getString("blood"); //to
    });
  }

  @override
  Widget build(BuildContext context) {
    AddTimeLineController addTimeLineController =
        Get.put(AddTimeLineController());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: HealthMateColors.shyGrey,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: HealthMateColors.bgColor,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(Icons.menu, color: HealthMateColors.happyGreen)),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 2.w, right: 2.w),
        child: ListView(
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
                              height.toString(),
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
                              weight.toString(),
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
                              blood.toString(),
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
                        for (int i = 0; i < allergens.length; i++)
                          Chip(
                            label: Text(
                              allergens[i],
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
                        for (int i = 0; i < diseases.length; i++)
                          Chip(
                            label: Text(
                              diseases[i],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          addTimeLineController.getTimelineData();
                        },
                        icon: Icon(Icons.refresh_outlined)),
                    IconButton(
                        onPressed: () {
                          Get.to(AddTimeLine());
                        },
                        icon: Icon(Icons.add_circle_outline)),
                  ],
                ),
              ],
            ),

            addTimeLineController.timelines.length > 0
                ? Container(
                    width: 100.w,
                    height: 50.h,
                    child: ListView.builder(
                        itemCount: addTimeLineController.timelines.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: () {
                              _showTestDialog(
                                  addTimeLineController.timelines[index]);
                            },
                            child: TimeLineCard(
                              timeline: addTimeLineController.timelines[index],
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
      ),
    );
  }

  void _showTestDialog(TimeLineResult result) {
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
}
