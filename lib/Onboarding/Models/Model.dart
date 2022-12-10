import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:hexcolor/hexcolor.dart';

List<PageViewModel> getPages() {
  TextStyle titleTextStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: HexColor("#FFFFFF"),
          fontWeight: FontWeight.bold,
          fontSize: 22.0));

  TextStyle bodyTextStyle = GoogleFonts.poppins(
      textStyle: TextStyle(
          color: HexColor("#FFFFFF"),
          fontWeight: FontWeight.bold,
          fontSize: 16.0));

  return [
    PageViewModel(
      image: Padding(
        padding: EdgeInsets.only(right: 5.w),
        child: Lottie.network(
            'https://assets7.lottiefiles.com/packages/lf20_98vgucqb.json',
            width: 400,
            height: 800),
      ),
      title: "Get latest updates",
      body: "Don’t miss any event and get latest updates on your phone",
      decoration: PageDecoration(
        titleTextStyle: titleTextStyle,
        bodyTextStyle: bodyTextStyle,
        pageColor: Colors.transparent,
      ),
    ),
    PageViewModel(
      image: Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: Lottie.network(
            'https://assets10.lottiefiles.com/packages/lf20_FG03fE0zz7.json',
            width: 500,
            height: 800),
      ),
      title: "Manage all your events",
      body: "View  attendance , badges and certificates",
      decoration: PageDecoration(
        titleTextStyle: titleTextStyle,
        bodyTextStyle: bodyTextStyle,
        pageColor: Colors.transparent,
      ),
    ),
    PageViewModel(
      image: Lottie.network(
          'https://assets4.lottiefiles.com/packages/lf20_ffkzpglj.json',
          width: 500,
          height: 800),
      title: "Connect with people in your college",
      body:
          " Pursue your passion and share your ideas with people in your college",
      decoration: PageDecoration(
        titleTextStyle: titleTextStyle,
        bodyTextStyle: bodyTextStyle,
        pageColor: Colors.transparent,
      ),
    ),
  ];
}
