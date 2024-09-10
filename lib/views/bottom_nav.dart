import 'package:coffeetime/commons/common_components.dart';
import 'package:coffeetime/helpers/color_helper.dart';
import 'package:coffeetime/views/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _selectedIndex = 0;

  List<String> _navImages = [
    'assets/iconImages/Home.png',
    'assets/iconImages/Heart.png',
    'assets/iconImages/Bag.png',
    'assets/iconImages/Notification.png',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));

    return Scaffold(
        body: Center(
          child: _screens[_selectedIndex],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent, // Remove splash effect
            highlightColor: Colors.transparent, // Remove highlight effect
          ),
          child: Container(
            height: 99.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                topRight: Radius.circular(24.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 70.h,
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: _buildImage(0),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: _buildImage(1),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: _buildImage(2),
                          label: '',
                        ),
                        BottomNavigationBarItem(
                          icon: _buildImage(3),
                          label: '',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      onTap: _onItemTapped,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                  ),
                  CommonComponents().bottomNoch()
                ],
              ),
            ),
          ),
        ));
  }

  Widget _buildImage(int index) {
    return index == 0
        ? Image.asset(
            _selectedIndex == 0
                ? "assets/iconImages/Home1.png"
                : _navImages[index],
            height: _selectedIndex == 0 ? 35.h : 20.w,
            width: _selectedIndex == 0 ? 22.w : 22.h,
          )
        : ColorFiltered(
            colorFilter: ColorFilter.mode(
              _selectedIndex == index
                  ? ColorHelper.primaryColor
                  : Colors.transparent,
              _selectedIndex == index ? BlendMode.srcIn : BlendMode.dst,
            ),
            child: Image.asset(
              _navImages[index],
              width: 24.w,
              height: 24.h,
            ),
          );
  }
}
