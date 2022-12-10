import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:medica/Screens/donations/donations_card.dart';
import 'package:medica/Screens/donations/donations_controller.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:sizer/sizer.dart';

class Donations extends StatefulWidget {
  const Donations({super.key});

  @override
  State<Donations> createState() => _DonationsState();
}

class _DonationsState extends State<Donations> {
  DonationsController donationsController = Get.put(DonationsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Donations",
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
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
                height: 80.h,
                width: 100.w,
                child: ListView.builder(
                    itemCount: donationsController.donations.length,
                    itemBuilder: ((context, index) {
                      return DonationsCard(
                        result: donationsController.donations[index],
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
