import 'package:coffeetime/commons/common_components.dart';
import 'package:coffeetime/helpers/color_helper.dart';
import 'package:coffeetime/helpers/space_helper.dart';
import 'package:coffeetime/helpers/style_helper.dart';
import 'package:coffeetime/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool deliver = true;
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
            child: _buildBody(),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 375.w,
              height: 165.h,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(2, 2),
                    ),
                  ],
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r))),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 186.h,
                          height: 39.w,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                "assets/iconImages/Wallet.png",
                                height: 20.h,
                                width: 20.w,
                              ),
                              SpaceHelper.horizontalSpace15,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CommonComponents().printText(
                                      textData: "Cash/Wallet",
                                      textStyle: StyleHelper.title),
                                  CommonComponents().printText(
                                      textData: "\$ 5.53",
                                      textStyle: StyleHelper.customTextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: ColorHelper.primaryColor)),
                                ],
                              )
                            ],
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 25.sp,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 56.h,
                      width: 327.w,
                      child: CommonComponents().commonButton(
                          text: "Order", onPressed: () {}, borderRadius: 16.r),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 5, left: 121.w, child: CommonComponents().bottomNoch())
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        _buildUpperBody(),
        SpaceHelper.verticalSpace5,
        _buildLowerBody()
      ],
    );
  }

  Widget _buildUpperBody() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpaceHelper.verticalSpace69,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: CommonComponents().commonTop(null, "Order"),
            ),
            SpaceHelper.verticalSpace30,
            Container(
              width: 327.w,
              height: 43.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: const Color(0xFFEDEDED)),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: 153.w,
                      height: 35.h,
                      child: CommonComponents().commonButton(
                          verticalPad: 5,
                          color: !deliver
                              ? const Color(0xFFEDEDED)
                              : ColorHelper.primaryColor,
                          text: "Deliver",
                          onPressed: () {
                            setState(() {
                              deliver = true;
                            });
                          },
                          fontSize: 16.sp,
                          fontWeight:
                              !deliver ? FontWeight.w400 : FontWeight.w600,
                          textColor: !deliver ? Colors.black : Colors.white,
                          borderRadius: 8.r),
                    ),
                    SizedBox(
                      width: 153.w,
                      height: 35.h,
                      child: CommonComponents().commonButton(
                          verticalPad: 5,
                          color: deliver
                              ? const Color(0xFFEDEDED)
                              : ColorHelper.primaryColor,
                          text: "Pick Up",
                          onPressed: () {
                            setState(() {
                              deliver = false;
                            });
                          },
                          fontSize: 16.sp,
                          fontWeight:
                              deliver ? FontWeight.w400 : FontWeight.w600,
                          textColor: deliver ? Colors.black : Colors.white,
                          borderRadius: 8.r),
                    )
                  ],
                ),
              ),
            ),
            SpaceHelper.verticalSpace20,
            _buildDeliveryDetail(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 173.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          "assets/images/coffee2.png",
                          height: 54.h,
                          width: 54.w,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonComponents().printText(
                              textData: "Caffe Mocha",
                              textStyle: StyleHelper.title),
                          CommonComponents().printText(
                              textData: "Deep Foam",
                              textStyle: StyleHelper.subTitle),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/iconImages/reduce.png",
                        height: 24.h,
                        width: 24.w,
                      ),
                      CommonComponents().printText(
                          textData: "1", textStyle: StyleHelper.title),
                      Image.asset(
                        "assets/iconImages/add.png",
                        height: 24.h,
                        width: 24.w,
                      ),
                    ],
                  ),
                )
              ],
            ),
            SpaceHelper.verticalSpace15,
          ],
        ),
      ),
    );
  }

  Widget _buildLowerBody() {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpaceHelper.verticalSpace15,
            Container(
              height: 56.h,
              width: 327.w,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 185.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "assets/iconImages/discount.png",
                            height: 20.h,
                            width: 20.w,
                          ),
                          CommonComponents().printText(
                              textData: "1 Discount is Applies",
                              textStyle: StyleHelper.customTextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 18.sp,
                        ))
                  ],
                ),
              ),
            ),
            SpaceHelper.verticalSpace20,
            CommonComponents().printText(
                textData: "Payment Summary",
                textStyle: StyleHelper.customTextStyle(
                    fontSize: 16, fontWeight: FontWeight.w600)),
            SpaceHelper.verticalSpace25,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonComponents().printText(
                    textData: "Price",
                    textStyle: StyleHelper.customTextStyle(
                        fontSize: 14, fontWeight: FontWeight.normal)),
                CommonComponents().printText(
                    textData: "\$ 4.53",
                    textStyle: StyleHelper.customTextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
            SpaceHelper.verticalSpace10,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonComponents().printText(
                    textData: "Delivery Fee",
                    textStyle: StyleHelper.customTextStyle(
                        fontSize: 14, fontWeight: FontWeight.normal)),
                Row(
                  children: [
                    CommonComponents().printText(
                        textData: "\$ 2.0",
                        textStyle: StyleHelper.customTextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                    SpaceHelper.horizontalSpace5,
                    CommonComponents().printText(
                        textData: "\$ 1.0",
                        textStyle: StyleHelper.customTextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                  ],
                )
              ],
            ),
            SpaceHelper.verticalSpace69,
            SpaceHelper.verticalSpace69
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonComponents().printText(
            textData: "Delivery Address",
            textStyle: StyleHelper.customTextStyle(
                fontSize: 16, fontWeight: FontWeight.w600)),
        SpaceHelper.verticalSpace15,
        CommonComponents().printText(
            textData: "Jl. Kpg Sutoyo",
            textStyle: StyleHelper.customTextStyle(
                fontSize: 14, fontWeight: FontWeight.w600)),
        SpaceHelper.verticalSpace3,
        CommonComponents().printText(
            textData: "JKpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
            textStyle: StyleHelper.customTextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorHelper.secondaryTextColor)),
        SpaceHelper.verticalSpace10,
        SizedBox(
          width: 229.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 26.h,
                width: 120.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90.r),
                    border: Border.all(color: const Color(0xFF313131))),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/iconImages/Edit.png",
                        height: 20.h,
                        width: 20.w,
                      ),
                      CommonComponents().printText(
                          textData: "Edit Address",
                          textStyle: StyleHelper.customTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF313131))),
                    ],
                  ),
                ),
              ),
              Container(
                height: 26.h,
                width: 101.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90.r),
                    border: Border.all(color: const Color(0xFF313131))),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        "assets/iconImages/Note.png",
                        height: 20.h,
                        width: 20.w,
                      ),
                      CommonComponents().printText(
                          textData: "Add Note",
                          textStyle: StyleHelper.customTextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF313131))),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
