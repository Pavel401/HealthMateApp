import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medica/Screens/Home/components/UnorderedListItem.dart';
import 'package:medica/constants/health_mate_colors.dart';
import 'package:medica/constants/health_mate_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import 'CustomExpansionWidget.dart';

List<String> userAvatars = [
  'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
  'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
  'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
  'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
  'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
  'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
  'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
  'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
  'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
  'https://pbs.twimg.com/media/D8dDZukXUAAXLdY.jpg',
  'https://pbs.twimg.com/profile_images/1249432648684109824/J0k1DN1T_400x400.jpg',
  'https://i0.wp.com/thatrandomagency.com/wp-content/uploads/2021/06/headshot.png?resize=618%2C617&ssl=1',
];
List<String> eventPhotos = [
  "https://unsplash.com/photos/hGHldbCgYDA/download?force=true&w=640",
  "https://unsplash.com/photos/gfVofr15ICc/download?force=true&w=640",
  "https://unsplash.com/photos/hGHldbCgYDA/download?force=true&w=640",
  "https://unsplash.com/photos/hGHldbCgYDA/download?force=true&w=640",
];
List<String> userNames = [
  "Anjela krish",
  "Alex Holms",
  "Raj james",
  "alan walker",
  "Weekend Jason",
  "Raj James"
      "Mabud401",
  "Alex Holms",
  "Raj James",
  "Mabud401",
  "Alex Holms",
  "Raj James"
];

class ExpandedTile extends StatefulWidget {
  @override
  State<ExpandedTile> createState() => _ExpandedTileState();
}

class _ExpandedTileState extends State<ExpandedTile> {
  @override
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

  // List<String> diseases = [
  //   "Asthma",
  //   "Cancer",
  //   "Diabetes",
  //   "Heart Disease",
  //   "Hypertension",
  //   "Kidney Disease",
  //   "Liver Disease",
  //   "Stroke",
  //   "Thyroid Disease",
  //   "Depression",
  //   "Anxiety",
  //   "Epilepsy",
  //   "Alzheimer's Disease",
  //   "Animea",
  //   "Arthritis",
  //   "Celiac Disease",
  // ];

  // List<String> allergens = [
  //   "Pollen",
  //   "Fish",
  //   "Lactose",
  //   "Nuts",
  //   "Rubber",
  //   "Egg",
  //   "Wheat",
  //   "Soy",
  //   "Shell Fish",
  //   "Sesame",
  //   "Dust"
  // ];
  @override
  Widget build(BuildContext context) {
    return CustomExpansionTile(
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      title: _buildTitle(),
      trailing: SizedBox(),
      // childrenPadding: EdgeInsets.only(left: 2.w, right: 2.w),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Allergy",
                    style: context.heading3.copyWith(
                      color: HealthMateColors.dullGrey,
                    )),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                    height: 12.h,
                    width: 20.w,
                    child: ListView.builder(
                        itemCount: allergens.length,
                        itemBuilder: (context, index) {
                          return Text(allergens[index],
                              style: context.heading3.copyWith(
                                color: HealthMateColors.shyGrey,
                              ));
                        })),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Disease",
                    style: context.heading3.copyWith(
                      color: HealthMateColors.dullGrey,
                    )),
                SizedBox(
                  height: 1.h,
                ),
                Container(
                    height: 12.h,
                    width: 20.w,
                    child: ListView.builder(
                        itemCount: diseases.length,
                        itemBuilder: (context, index) {
                          return Text(diseases[index],
                              style: context.heading3.copyWith(
                                color: HealthMateColors.shyGrey,
                              ));
                        })),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Column(
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
            Icon(
              Icons.more_vert,
              color: HealthMateColors.shyGrey,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [SvgPicture.asset("assets/svgs/Line.svg")],
        ),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}

// class ModeratorAvatar extends StatelessWidget {
//   final String imageUrl;
//   final String userName;
//   const ModeratorAvatar({
//     Key? key,
//     required this.imageUrl,
//     required this.userName,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         CircleAvatar(
//           radius: 3.0.h,
//           backgroundColor: Colors.black,
//           child: CircleAvatar(
//             radius: 2.8.h,
//             backgroundImage: CachedNetworkImageProvider(
//               imageUrl,
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 2.w,
//         ),
//         SizedBox(
//           width: 18.w,
//           child: Text(
//             userName,
//             maxLines: 2,
//             style: TextStyle(
//                 fontFamily: 'ClashDisplay-Light',
//                 color: HealthMateColors.sexyPurple,
//                 fontStyle: FontStyle.normal,
//                 fontSize: 10.sp,
//                 letterSpacing: 0.5,
//                 fontWeight: FontWeight.w600),
//           ),
//         )
//       ],
//     );
//   }
// }
