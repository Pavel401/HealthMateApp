import 'package:flutter/material.dart';
import 'package:medica/constants/health_mate_colors.dart';

class HealthMateThemes {
  static ThemeData userTheme =
      ThemeData(fontFamily: 'Montserrat', textTheme: textTheme);
  static TextTheme textTheme = TextTheme(
    //Heading 1 style..uppercase should be done by the string
    headline1: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4),

    //Heading 2 style..
    headline2: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.4),

    //subtitle 1 style..
    subtitle1: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4),

    //subtitle 2 style..
    subtitle2: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.4),

    //Body 1 in design system
    bodyText1: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w400),

    //Body 2 in design system
    bodyText2: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 12,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w400),

    //Small-1 in design system
    headline4: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 14,
        letterSpacing: 0.4,
        fontWeight: FontWeight.w500),

    //highlight in design system..
    headline3: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 12,
        letterSpacing: 0.25,
        fontWeight: FontWeight.w600),

    //caption..
    caption: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: 10,
        letterSpacing: 0.5,
        fontWeight: FontWeight.w400),
  );
}

extension UIThemeExtension on BuildContext {
  // * (default) TextTheme
  TextStyle get heading1 => Theme.of(this).textTheme.headline1!;
  TextStyle get heading2 => Theme.of(this).textTheme.headline2!;
  TextStyle get heading3 => Theme.of(this).textTheme.headline3!;
  TextStyle get heading4 => Theme.of(this).textTheme.headline4!;

  TextStyle get subtitle1 => Theme.of(this).textTheme.subtitle1!;
  TextStyle get subtitle2 => Theme.of(this).textTheme.subtitle2!;

  TextStyle get body1 => Theme.of(this).textTheme.bodyText1!;
  TextStyle get body2 => Theme.of(this).textTheme.bodyText2!;
  TextStyle get small1 => Theme.of(this).textTheme.headline4!;
  TextStyle get highlight => Theme.of(this).textTheme.headline3!;
  TextStyle get caption => Theme.of(this).textTheme.caption!;
}
