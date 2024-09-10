import 'package:coffeetime/commons/common_components.dart';
import 'package:coffeetime/helpers/color_helper.dart';
import 'package:coffeetime/helpers/space_helper.dart';
import 'package:coffeetime/helpers/style_helper.dart';
import 'package:coffeetime/utils/screen_size.dart';
import 'package:coffeetime/views/Home/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

bool readMore = false;
String desc =
    "A cappuccino is an approximately 150 ml (5 oz) beverage, traditionally composed of 25 ml of espresso coffee and 85 ml of fresh milk. The milk is steamed to create a rich, creamy foam, which is an essential characteristic of the drink. ";
int selectedIndex = 1;

List<String> sizes = ["S", "L", "M"];

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: ScreenSizeConfig.screenHeight,
            width: ScreenSizeConfig.screenWidth,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 26.w),
              child: _buildBody(),
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: _buildBottom()),
          Positioned(
              bottom: 5, left: 121.w, child: CommonComponents().bottomNoch())
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpaceHelper.verticalSpace69,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CommonComponents()
              .commonTop("assets/iconImages/Heart.png", "Detail"),
        ),
        SpaceHelper.verticalSpace30,
        _buildDescription(),
        CommonComponents().printText(
            textData: "Size",
            textStyle: StyleHelper.customTextStyle(
                fontSize: 16, fontWeight: FontWeight.w600)),
        SpaceHelper.verticalSpace15,
        _buildSizeSelection()
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              "assets/images/coffeeDetail.png",
              fit: BoxFit.contain,
              width: 327.w,
              height: 220.h,
            )),
        SpaceHelper.verticalSpace10,
        CommonComponents().printText(
            textData: "Caffe Mocha",
            textStyle: StyleHelper.customTextStyle(
                fontSize: 20, fontWeight: FontWeight.w600)),
        SizedBox(
          width: 327.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonComponents().printText(
                  textData: "Ice/Hot",
                  textStyle: StyleHelper.customTextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400)),
              SizedBox(
                width: 156.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonComponents().comonContainer(
                        color: const Color.fromARGB(235, 219, 219, 203)
                            .withOpacity(0.1),
                        radius: 12.r,
                        height: 44,
                        width: 44,
                        element: Image.asset(
                          "assets/images/detail1.png",
                          height: 20.h,
                          width: 20.w,
                        )),
                    CommonComponents().comonContainer(
                        color: const Color.fromARGB(235, 219, 219, 203)
                            .withOpacity(0.1),
                        radius: 12.r,
                        height: 44,
                        width: 44,
                        element: Image.asset(
                          "assets/images/detail2.png",
                          height: 20.h,
                          width: 20.w,
                        )),
                    CommonComponents().comonContainer(
                        color: const Color.fromARGB(235, 219, 219, 203)
                            .withOpacity(0.1),
                        radius: 12.r,
                        height: 44,
                        width: 44,
                        element: Image.asset(
                          "assets/images/detail3.png",
                          height: 20.h,
                          width: 20.w,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Image.asset(
              "assets/iconImages/star.png",
              height: 20.h,
              width: 20.w,
            ),
            SpaceHelper.horizontalSpace3,
            CommonComponents().printText(
                textData: "4.8",
                textStyle: StyleHelper.customTextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600)),
            SpaceHelper.horizontalSpace3,
            CommonComponents().printText(
                textData: "(230)",
                textStyle: StyleHelper.customTextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ColorHelper.secondaryTextColor))
          ],
        ),
        SpaceHelper.verticalSpace10,
        Padding(
          padding: EdgeInsets.only(left: 15.w),
          child: SizedBox(
              width: 295.w,
              child: const Divider(
                color: Color(0xFFE3E3E3),
              )),
        ),
        SpaceHelper.verticalSpace10,
        CommonComponents().printText(
            textData: "Description",
            textStyle: StyleHelper.customTextStyle(
                fontSize: 16, fontWeight: FontWeight.w600)),
        SpaceHelper.verticalSpace10,
        RichText(
          text: TextSpan(
            style: StyleHelper.customTextStyle(
                fontSize: 14, fontWeight: FontWeight.w300),
            children: [
              TextSpan(
                text: readMore ? desc : desc.substring(0, 100),
              ),
              WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      readMore = !readMore;
                    });
                  },
                  child: Text(
                    readMore ? 'Read less' : 'Read more',
                    style: StyleHelper.customTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorHelper.primaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
        SpaceHelper.verticalSpace10,
      ],
    );
  }

  Widget _buildSizeSelection() {
    return SizedBox(
      width: 320.w,
      height: 41.h,
      child: Padding(
        padding: EdgeInsets.only(left: 4.w),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: sizes.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Container(
                    height: 41.h,
                    width: 96.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: selectedIndex == index
                                ? ColorHelper.primaryColor
                                : ColorHelper.secondaryTextColor),
                        color: selectedIndex == index
                            ? ColorHelper.primaryColor.withOpacity(0.1)
                            : Colors.white),
                    child: Center(
                      child: CommonComponents().printText(
                          textData: sizes[index],
                          textStyle: StyleHelper.customTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: selectedIndex == index
                                  ? ColorHelper.primaryColor
                                  : ColorHelper.secondaryTextColor)),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      width: 375.w,
      height: 118.h,
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r))),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 76.h,
              height: 48.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonComponents().printText(
                      textData: "Price",
                      textStyle: StyleHelper.customTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorHelper.secondaryTextColor)),
                  CommonComponents().printText(
                      textData: "\$ 4.53",
                      textStyle: StyleHelper.customTextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: ColorHelper.primaryColor)),
                ],
              ),
            ),
            SizedBox(
              height: 56.h,
              width: 217.w,
              child: CommonComponents().commonButton(
                  text: "Buy Now",
                  onPressed: () {
                    Get.to(const OrderScreen());
                  },
                  borderRadius: 16.r),
            )
          ],
        ),
      ),
    );
  }
}
