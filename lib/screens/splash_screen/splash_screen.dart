import 'package:cashqwik/screens/splash_screen/splash_screen_vm.dart';
import 'package:cashqwik/utility/common/common_navigate.dart';
import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  SplashScreenVM viewModel = SplashScreenVM();

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..forward();

  late final Animation<double> _animation =
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn);

  @override
  void initState() {
    super.initState();
    //navigatetoWelcomeScreen();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    viewModel.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    viewModel.setContext(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: SizeUtils.getHeight(24)),
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  logo1(),
                ],
              ),
              /* SvgPicture.asset(
                Utils.getAssetSvg("splogo"),
                fit: BoxFit.cover,
                height: SizeUtils.getHeight(70),
              ), */
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget logo1() {
    return ScaleTransition(
      scale: _animation,
      child: SizedBox(
        height: SizeUtils.getHeight(240),
        child: Image.asset(
          Utils.getAssetPng("logo"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  /*navigatetoWelcomeScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    CommonNavigate(parentContext: context).navigateWelcomeScreen();
  }*/
}
