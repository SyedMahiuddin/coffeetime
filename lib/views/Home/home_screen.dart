import 'package:coffeetime/commons/common_components.dart';
import 'package:coffeetime/helpers/color_helper.dart';
import 'package:coffeetime/helpers/space_helper.dart';
import 'package:coffeetime/helpers/style_helper.dart';
import 'package:coffeetime/utils/screen_size.dart';
import 'package:coffeetime/views/Home/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/nav2/get_router_delegate.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> catList = ["All Coffee", "Machiato", "Latte", "Americano"];
  bool suggestPlace = false;

  List<Map<String, dynamic>> items = [
    {
      'image': 'assets/images/coffee1.png',
      'name': 'Caffe Mocha',
      'cat': 'Deep Foam',
      'price': "4.53",
    },
    {
      'image': 'assets/images/coffee2.png',
      'name': 'Flat White',
      'cat': 'Espresso',
      'price': "3.53",
    },
    {
      'image': 'assets/images/coffee3.png',
      'name': 'Creamy Sugar',
      'cat': 'Deep Foam',
      'price': "4.63",
    },
    {
      'image': 'assets/images/coffee4.png',
      'name': 'Black',
      'cat': 'Capacino',
      'price': "9.53",
    }
  ];

  List<String> allPlaces = [
    "Bilzen, Tanjungbalai",
    "Dhaka, Bangladesh",
    "Khulna, Bangladesh",
    "Chittagong, Bangladesh",
    "Sylhet, Bangladesh"
  ];
  int selectedIndex = 0;
  int selectedPlaceIndex = 0;
  String place = "Bilzen, Tanjungbalai";

  @override
  Widget build(BuildContext context) {
    ScreenSizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 350.h,
            width: ScreenSizeConfig.screenWidth,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 280.h,
                    width: ScreenSizeConfig.screenWidth,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF111111),
                        Color(0xFF313131),
                      ],
                    )),
                  ),
                ),
                Positioned(top: 68.h, left: 24.w, child: _buildPlacePicker()),
                Positioned(top: 135.h, left: 24.w, child: _buildSearchView()),
                Positioned(bottom: 1.h, left: 24.w, child: _buildBannerView()),
                suggestPlace
                    ? Positioned(
                        top: 110.h, left: 24.w, child: _buildPlaceSuggessions())
                    : const SizedBox(),
              ],
            ),
          ),
          SpaceHelper.verticalSpace15,
          _builSubCatSelection(),
          SpaceHelper.verticalSpace10,
          _buildItemGrid(),
          SpaceHelper.verticalSpace10
        ],
      ),
    );
  }

  Widget _buildSearchView() {
    return SizedBox(
      width: 327.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 52.h,
            width: 259.w,
            decoration: BoxDecoration(
                color: const Color(0xff2a2a2a),
                borderRadius: BorderRadius.circular(12.r)),
            child: Row(
              children: [
                Image.asset(
                  "assets/iconImages/search.png",
                  height: 12.27.h,
                  width: 16.89.w,
                ),
                SpaceHelper.horizontalSpace10,
                SizedBox(
                  width: 150.w,
                  child: TextField(
                    style: StyleHelper.customTextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search coffee',
                      hintStyle: StyleHelper.customTextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorHelper.secondaryTextColor),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CommonComponents().comonContainer(
              height: 52,
              width: 52,
              radius: 12,
              element: Image.asset(
                "assets/iconImages/filter.png",
                height: 20.sp,
                width: 20.sp,
              ))
        ],
      ),
    );
  }

  Widget _buildPlacePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonComponents().printText(
            textData: "Location",
            textStyle: StyleHelper.customTextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: ColorHelper.secondaryTextColor)),
        SpaceHelper.verticalSpace5,
        Row(
          children: [
            CommonComponents().printText(
                textData: place,
                textStyle: StyleHelper.customTextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: const Color(0xFFD8D8D8))),
            InkWell(
              onTap: () {
                setState(() {
                  suggestPlace = !suggestPlace;
                });
              },
              child: Icon(
                suggestPlace
                    ? Icons.keyboard_arrow_up_sharp
                    : Icons.keyboard_arrow_down_sharp,
                size: 20.sp,
                color: Colors.white,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildBannerView() {
    return Container(
      height: 140.w,
      width: 327.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              "assets/images/banner.png",
              fit: BoxFit.cover,
              height: 140.w,
              width: 327.w,
            ),
          ),
          Positioned(
              left: 24.w,
              top: 13.h,
              child: SizedBox(
                height: 114.h,
                width: 204.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 26.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: ColorHelper.redAccentColor),
                      child: Center(
                        child: CommonComponents().printText(
                            textData: "Promo",
                            textStyle: StyleHelper.customTextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                    CommonComponents().printText(
                        maxLine: 2,
                        textData: "Buy one get one FREE",
                        textStyle: StyleHelper.customTextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w600))
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Widget _builSubCatSelection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: SizedBox(
        height: 29.h,
        width: 327.w,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: catList.length,
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
                    height: 29.h,
                    width: 87.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: selectedIndex == index
                            ? ColorHelper.primaryColor
                            : Colors.white),
                    child: Center(
                      child: CommonComponents().printText(
                          textData: catList[index],
                          textStyle: StyleHelper.customTextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black)),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget _buildItemGrid() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26.w),
      child: SizedBox(
        width: 327.w,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.sp,
            crossAxisSpacing: 12.sp,
            childAspectRatio: 156.w / 238.h,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            var item = items[index];
            return GestureDetector(
              onTap: () {
                Get.to(const DetailScreen());
              },
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.w, 12.h, 0.w, 0.w),
                child: Container(
                  height: 238.h,
                  width: 156.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(16.r),
                              child: Image.asset(item["image"],
                                  height: 128.h,
                                  width: 140.w,
                                  fit: BoxFit.cover)),
                          CommonComponents().printText(
                              textData: item["name"],
                              textStyle: StyleHelper.title),
                          CommonComponents().printText(
                              textData: item["cat"],
                              textStyle: StyleHelper.subTitle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonComponents().printText(
                                  textData: item["price"],
                                  textStyle: StyleHelper.title),
                              CommonComponents().comonContainer(
                                  height: 32,
                                  width: 32,
                                  element: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 16.sp,
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPlaceSuggessions() {
    return Container(
      width: 200.w,
      height: 200.h,
      decoration: BoxDecoration(
          color: ColorHelper.secondaryTextColor.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16.r)),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: allPlaces.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  suggestPlace = false;
                  place = allPlaces[index];
                });
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, top: 5.h),
                    child: CommonComponents().printText(
                        textData: allPlaces[index],
                        textStyle: StyleHelper.customTextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                  const Divider(
                    color: Colors.white,
                  )
                ],
              ),
            );
          }),
    );
  }
}
