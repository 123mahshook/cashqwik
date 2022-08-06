import 'package:cashqwik/screens/articles_screen/articles_screen.dart';
import 'package:cashqwik/screens/history_screen/history_screen.dart';
import 'package:cashqwik/screens/bottom_nav_screen/bottom_nav_screen_vm.dart';
import 'package:cashqwik/screens/home_screen/home_screen.dart';
import 'package:cashqwik/screens/profile_screen/profile_screen.dart';

import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BottomNavScreen extends StatefulWidget {
  final int selectedIndex;

  const BottomNavScreen({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  BottomNavScreenVM viewModel = BottomNavScreenVM();
  bool isTechnician = false;

  int selectedIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const HistoryScreen(),
    const OrderScreen(),
    const ProfileScreen()
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  List<String> icons = ["f_home", "f_history", "f_articles", "f_plus"];

  List<String> titles = ["Home", "history", "Articles", ""];

  @override
  void initState() {
    // TODO: implement initState]
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  DateTime? currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: "Press back again to exit",
          backgroundColor: AppColors.primaryColor);
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.setContext(context);
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: AppColors.gradiantTwoColor.withOpacity(0.3),
          statusBarBrightness: Brightness.light),
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          // backgroundColor: AppColors.gradiantTwoColor,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: bottomNavBar(),
          body: SafeArea(
            bottom: false,
            child: SizedBox(
              height: SizeUtils.getScreenHeight(),
              width: SizeUtils.getScreenWidth(),
              child: PageStorage(
                  bucket: bucket,
                  child: screens[selectedIndex] //  screens[selectedIndex],
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomNavBar() {
    return Container(
      decoration: BoxDecoration(color: AppColors.white, boxShadow: [
        BoxShadow(
            spreadRadius: SizeUtils.getRadius(15),
            blurRadius: SizeUtils.getRadius(30),
            color: AppColors.lightGrey.withOpacity(0.07))
      ]),
      height: SizeUtils.getHeight(75),
      width: SizeUtils.getScreenWidth(),
      padding: EdgeInsets.only(
          // top: SizeUtils.getHeight(5),
          right: SizeUtils.getWidth(24),
          left: SizeUtils.getWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
            4,
            (index) => index == 3
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: SizeUtils.getHeight(13)),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        primary: AppColors.yellowColor,
                        backgroundColor:
                            index == 3 ? AppColors.yellowColor : null,
                        padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.getWidth(6),
                          // vertical: SizeUtils.getHeight(2)
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image.asset(
                                Utils.getAssetPng(icons[index]),
                                color: AppColors.black,
                                height: SizeUtils.getHeight(20),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : TextButton(
                    style: TextButton.styleFrom(
                      shape: CircleBorder(),
                      primary: AppColors.yellowColor,
                      //   backgroundColor: index == 3 ? AppColors.yellowColor : null,
                      padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.getWidth(6),
                        // vertical: SizeUtils.getHeight(2)
                      ),
                      alignment: index == 3 ? Alignment.center : null,
                    ),
                    onPressed: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        selectedIndex == index
                            ? index == 3
                                ? SizedBox()
                                : Container(
                                    height: SizeUtils.getHeight(3),
                                    width: SizeUtils.getWidth(30),
                                    decoration: BoxDecoration(
                                        color: AppColors.black,
                                        borderRadius: BorderRadius.circular(
                                            SizeUtils.getRadius(8))),
                                  )
                            : SizedBox(),
                        verticalSpace(selectedIndex == index ? 14 : 17),
                        Column(
                          children: [
                            Image.asset(
                              Utils.getAssetPng(icons[index]),
                              color: selectedIndex == index
                                  ? AppColors.black
                                  : AppColors.textGrey,
                              height: SizeUtils.getHeight(22),
                            ),
                            verticalSpace(4),
                            Text(titles[index],
                                style: FontUtils.getFont12Style(
                                    color: selectedIndex == index
                                        ? AppColors.black
                                        : AppColors.textGrey))
                          ],
                        ),
                      ],
                    ),
                  )),
      ),
    );
  }
}
