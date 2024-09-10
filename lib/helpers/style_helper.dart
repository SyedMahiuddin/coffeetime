import 'package:coffeetime/helpers/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyleHelper {
  static TextStyle customTextStyle({
    double fontSize = 12.0,
    FontWeight fontWeight = FontWeight.w400,
    TextDecoration decoration = TextDecoration.none,
    Color color = ColorHelper.primaryTextColor,
  }) {
    return GoogleFonts.sora(
      decoration: decoration,
      color: color,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  static final TextStyle heading = GoogleFonts.sora(
    color: Colors.white,
    fontSize: 36.sp,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle title = GoogleFonts.sora(
      color: ColorHelper.primaryTextColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w600);

  static final TextStyle subHeading = GoogleFonts.sora(
      color: ColorHelper.secondaryTextColor,
      fontSize: 14.sp,
      fontWeight: FontWeight.w400);

  static final TextStyle subTitle = GoogleFonts.sora(
      color: ColorHelper.secondaryTextColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400);
}
