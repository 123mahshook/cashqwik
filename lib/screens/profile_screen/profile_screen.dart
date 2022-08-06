import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/no_glow_scroll_behaviour.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    // viewModel.setBasicDetails();
    super.initState();
  }

  String image = "";
  String userName = "";

  changeState() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeUtils.getScreenHeight(),
      width: SizeUtils.getScreenWidth(),
      padding: EdgeInsets.only(top: SizeUtils.getHeight(8)),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.gradientOneColor, AppColors.gradiantTwoColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: ScrollConfiguration(
        behavior: NoGlowScrollBehaviour(),
        child: SingleChildScrollView(
          child: Column(
            children: [appBar()],
          ),
        ),
      ),
    );
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(SizeUtils.getRadius(5)),
              bottomRight: Radius.circular(SizeUtils.getRadius(5)),
              bottomLeft: Radius.circular(SizeUtils.getRadius(8)),
              topLeft: Radius.circular(SizeUtils.getRadius(8)))),
      height: SizeUtils.getHeight(50),
      width: SizeUtils.getScreenWidth(),
      padding: EdgeInsets.only(
          left: SizeUtils.getWidth(24), right: SizeUtils.getWidth(24)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: SizeUtils.getHeight(32),
            width: SizeUtils.getHeight(32),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              Utils.getAssetPng("profile_dummy"),
              fit: BoxFit.contain,
            ),
          ),
          Spacer(),
          Text(
            "Profile",
            style: FontUtils.getFont14Style(
                color: AppColors.black, fontWeight: FontWeight.w600),
          ),
          Spacer(),
          horizontalSpace(10),
          Container(
            height: SizeUtils.getHeight(22),
            width: SizeUtils.getHeight(22),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            /*child: Image.asset(
              Utils.getAssetPng("f_notification"),
              height: SizeUtils.getHeight(12),
              fit: BoxFit.contain,
            ),*/
          ),
        ],
      ),
    );
  }
}
