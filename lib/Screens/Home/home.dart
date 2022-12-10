import 'dart:convert';

import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:medica/Screens/Add%20Mesurements/add_mesurements.dart';
import 'package:medica/Screens/Home/components/glucose.dart';
import 'package:medica/Screens/Home/tabs/Daily%20records/Dailyrecords.dart';
import 'package:medica/Screens/Home/tabs/analyse/Analyse.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:medica/helper/components/CommonTab.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'components/common_disease_cards.dart';
import 'components/expandable_medical_card.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Medical Card",
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
        padding: EdgeInsets.only(
          left: 2.w,
          right: 2.w,
        ),
        child: ListView(
          children: [
            ExpandedTile(),
            Container(
              height: 75.h,
              width: 100.w,
              child: HealthMateCommonTabBar(
                tabController: tabController,
                titleAndWidget: {
                  'Daily Records': DailyRecords(),
                  'Analyse': Analyse(),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
