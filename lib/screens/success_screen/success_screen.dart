import 'package:cashqwik/screens/bottom_nav_screen/bottom_nav_screen.dart';
import 'package:cashqwik/utility/common/common_navigate.dart';
import 'package:cashqwik/utility/components/footer_button.dart';
import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  late final AssetsAudioPlayer assetsAudioPlayer;

  setAudio() async {
    try {
      // await Future.delayed(const Duration(seconds: 2));
      await assetsAudioPlayer.open(Audio(Utils.getAssetAudio("success")));
    } catch (_) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    setAudio();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          padding: EdgeInsets.only(
              left: SizeUtils.getWidth(24),
              right: SizeUtils.getWidth(24),
              bottom: SizeUtils.getWidth(24)),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(Utils.getAssetPng("success_bg")),
                fit: BoxFit.cover),
            gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [AppColors.trendLightGreen1, AppColors.trendDarkGreen]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              verticalSpace(35),
              SizedBox(
                  height: SizeUtils.getHeight(292),
                  width: SizeUtils.getWidth(144),
                  child: Image.asset(Utils.getAssetPng("success"))),
              Align(
                heightFactor: 0.1,
                child: Lottie.asset(
                  Utils.getAssetLottie("success"),
                  repeat: false,
                  fit: BoxFit.fill,
                  height: SizeUtils.getHeight(200),
                ),
              ),
              verticalSpace(80),
              Text(
                "Your order has been\nplaced successfully.",
                textAlign: TextAlign.center,
                style: FontUtils.getFont24Style(
                    color: AppColors.white, fontWeight: FontWeight.w500),
              ),
              verticalSpace(16),
              Text(
                'You can track the delivery in the "Orders" section.',
                style: FontUtils.getFont12Style(color: AppColors.white),
              ),
              const Spacer(),
              FooterButton(
                style: FontUtils.getFont16Style(color: AppColors.white),
                label: "Track your Order",
                onTap: () {
                  /* CommonNavigate(parentContext: context).navigateOrderScreen();*/
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const BottomNavScreen(selectedIndex: 3),
                      ),
                      (route) => false);
                },
                color: AppColors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
