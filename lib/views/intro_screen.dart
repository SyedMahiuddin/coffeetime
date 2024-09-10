import 'package:coffeetime/commons/common_components.dart';
import 'package:coffeetime/helpers/space_helper.dart';
import 'package:coffeetime/helpers/style_helper.dart';
import 'package:coffeetime/utils/screen_size.dart';
import 'package:coffeetime/views/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});
  String introHeading = "Fall in Love with Coffee in Blissful Delight!";
  String introSub =
      "Welcome to our cozy coffee corner, where every cup is a delightful for you.";
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        height: ScreenSizeConfig.screenHeight,
        width: ScreenSizeConfig.screenWidth,
        child: Stack(
          children: [
            SizedBox(
              height: ScreenSizeConfig.screenHeight,
              width: ScreenSizeConfig.screenWidth,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: ScreenSizeConfig.screenWidth,
                height: 536.h,
                child: Image.asset(
                  "assets/images/intro.png",
                  width: ScreenSizeConfig.screenWidth,
                  height: 536.h,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Align(alignment: Alignment.bottomCenter, child: _buildIntroTexts()),
            Positioned(
                bottom: 10.h,
                left: 121.w,
                child: CommonComponents()
                    .bottomNoch(color: const Color(0xFF242424)))
          ],
        ),
      ),
    );
  }

  Widget _buildIntroTexts() {
    return Container(
      width: 375.w,
      height: 360.h,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(1, 5, 5, 5),
          Color(0xFF050505),
        ],
      )),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CommonComponents().printText(
                maxLine: 3,
                textAlign: TextAlign.center,
                textData: introHeading,
                textStyle: StyleHelper.heading),
            SpaceHelper.verticalSpace8,
            CommonComponents().printText(
                maxLine: 2,
                textAlign: TextAlign.center,
                textData: introSub,
                textStyle: StyleHelper.subHeading),
            SpaceHelper.verticalSpace30,
            SizedBox(
              height: 56.h,
              child: CommonComponents().commonButton(
                  borderRadius: 16,
                  text: "Get Started",
                  onPressed: () {
                    Get.offAll(BottomNavScreen());
                  }),
            )
          ],
        ),
      ),
    );
  }
}
