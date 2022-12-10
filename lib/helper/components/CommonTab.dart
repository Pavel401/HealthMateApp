import 'package:flutter/material.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';

class HealthMateCommonTabBar extends StatelessWidget {
  const HealthMateCommonTabBar({
    super.key,
    required this.tabController,
    required this.titleAndWidget,
    this.height,
  });
  final TabController tabController;
  final double? height;
  final Map<String, dynamic> titleAndWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40, left: 16, right: 16),
              height: 1,
              decoration: BoxDecoration(color: HealthMateColors.dullGrey),
            ),
            TabBar(
              indicator: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: HealthMateColors.dullGrey,
                    offset: Offset(4, -2),
                    spreadRadius: 0,
                    blurRadius: 0,
                  ),
                  BoxShadow(
                    color: HealthMateColors.dullGrey,
                    offset: Offset(-1, -2),
                    spreadRadius: 0,
                    blurRadius: 0,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              labelPadding: const EdgeInsets.symmetric(vertical: 4),
              controller: tabController,
              labelColor: HealthMateColors.happyGreen,
              unselectedLabelColor: HealthMateColors.dullGrey,
              labelStyle: context.body1.copyWith(fontWeight: FontWeight.bold),
              unselectedLabelStyle: context.body2,
              tabs: [
                for (String title in titleAndWidget.keys) Text(title),
              ],
            ),
          ],
        ),
        if (height == null)
          Expanded(
            child: TabBarView(
              controller: tabController,
              physics: const BouncingScrollPhysics(),
              children: [
                for (var title in titleAndWidget.values) title,
              ],
            ),
          ),
        if (height != null)
          SizedBox(
            height: height,
            child: TabBarView(
              controller: tabController,
              physics: const BouncingScrollPhysics(),
              children: [
                for (var title in titleAndWidget.values) title,
              ],
            ),
          ),
      ],
    );
  }
}
