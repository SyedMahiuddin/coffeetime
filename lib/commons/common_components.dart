import 'dart:io';
import 'package:coffeetime/helpers/color_helper.dart';
import 'package:coffeetime/helpers/space_helper.dart';
import 'package:coffeetime/helpers/style_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommonComponents {
  Widget printText(
      {required String textData,
      Color? color = Colors.white,
      TextAlign textAlign = TextAlign.start,
      required TextStyle textStyle,
      int maxLine = 1}) {
    return Text(
      textData,
      textAlign: textAlign,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: textStyle,
    );
  }

  Widget commonTop(String? image, String text) {
    return SizedBox(
      width: 327.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_sharp,
              size: 18.sp,
            ),
          ),
          printText(
              textData: text,
              textStyle: StyleHelper.customTextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF242424))),
          image == null
              ? SizedBox(
                  width: 10.w,
                )
              : Image.asset(
                  image,
                  height: 19.5.h,
                  width: 20.47.w,
                )
        ],
      ),
    );
  }

  Widget comonContainer(
      {double height = 40,
      double width = 40,
      double radius = 12,
      Color color = ColorHelper.primaryColor,
      Widget? element}) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius.r)),
      child: Center(
        child: element ?? const SizedBox(),
      ),
    );
  }

  Widget bottomNoch(
      {double radius = 100,
      double height = 5,
      double width = 134,
      Color color = Colors.black}) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
    );
  }

  Widget commonButton(
      {required text,
      required VoidCallback onPressed,
      bool disabled = false,
      Icon? icon,
      String? imagePath,
      double borderRadius = 24,
      double fontSize = 16,
      Color color = ColorHelper.primaryColor,
      double verticalPad = 12,
      double horizontalPad = 24,
      FontWeight fontWeight = FontWeight.w600,
      bool isLoading = false,
      Color textColor = Colors.white}) {
    return GestureDetector(
      onTap: disabled ? null : onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: verticalPad.h, horizontal: horizontalPad.w),
        decoration: BoxDecoration(
          color: disabled
              ? ColorHelper.secondaryTextColor
              : color, // Change this to your desired color
          borderRadius: BorderRadius.circular(borderRadius), // Rounded corners
        ),
        child: Center(
          child: isLoading
              ? Container(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: ColorHelper.primaryColor,
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ??
                        (imagePath != null
                            ? Image.asset(imagePath)
                            : const SizedBox()),
                    SpaceHelper.horizontalSpace5,
                    Text(
                      text,
                      style: StyleHelper.customTextStyle(
                          fontSize: fontSize.sp,
                          fontWeight: fontWeight,
                          color: textColor),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
