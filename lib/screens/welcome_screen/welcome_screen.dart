import 'package:cashqwik/utility/common/common_navigate.dart';
import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoderBuilder,
            Utils.getAssetSvg("img_onboarding1")),
        null);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
              top: SizeUtils.getHeight(16),
              left: SizeUtils.getWidth(16),
              right: SizeUtils.getWidth(16)),
          height: SizeUtils.getScreenHeight(),
          width: SizeUtils.getScreenWidth(),
          color: AppColors.white,
          child: Column(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: SizeUtils.getHeight(620),
                width: SizeUtils.getScreenWidth(),
                decoration: BoxDecoration(
                    color: AppColors.tileGreenColor,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(25))),
                child: Stack(
                  children: [
                    Container(
                      foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                            AppColors.transparent,
                            AppColors.tileGreenColor.withOpacity(0.1),
                            AppColors.tileGreenColor.withOpacity(0.5),
                            AppColors.tileGreenColor.withOpacity(0.6),
                            AppColors.tileGreenColor.withOpacity(0.7),
                            AppColors.tileGreenColor,
                          ])),
                      height: SizeUtils.getHeight(520),
                      width: SizeUtils.getScreenWidth(),
                      child: Image.asset(
                        Utils.getAssetJpg("f_onboard"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: SizeUtils.getHeight(600),
                        width: SizeUtils.getScreenWidth(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Spacer(),
                            Text(
                              "Everything at\nyour fingertips",
                              textAlign: TextAlign.center,
                              style: FontUtils.getFont36Style(
                                  color: AppColors.black),
                            ),
                            verticalSpace(15),
                            Text(
                              "Delivering happiness and needs",
                              textAlign: TextAlign.center,
                              style: FontUtils.getFont12Style(
                                color: AppColors.black,
                              ),
                            ),
                            verticalSpace(50),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Align(heightFactor: 0.85, child: ShakeWidget()

                  /* child: ClipPath(
                    clipper: ShapedBox(),
                    child: SizedBox(
                      height: SizeUtils.getHeight(50),
                      width: SizeUtils.getWidth(180),
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            padding: EdgeInsets.zero,
                            primary: AppColors.white),
                        onPressed: () {
                          CommonNavigate(parentContext: context).navigateOnBoardingScreen();
                        },
                        child: SvgPicture.asset(
                          Utils.getAssetSvg("next"),
                          color: AppColors.black,
                          fit: BoxFit.cover,
                          height: SizeUtils.getHeight(14),
                          width: SizeUtils.getWidth(7),
                        ),
                      ),
                    ),
                  ), */
                  ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    Key? key,
    this.duration = const Duration(seconds: 2),
    this.deltaX = 30,
    this.curve = Curves.bounceOut,
    // @required this.child,
  }) : super(key: key);

  final Duration duration;
  final double deltaX;
  // final Widget child;
  final Curve curve;

  @override
  _ShakeWidgetState createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// convert 0-1 to 0-1-0
  double shake(double value) =>
      2 * (0.5 - (0.5 - widget.curve.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(widget.deltaX * shake(controller.value), 0),
        child: child,
      ),
      child: ClipPath(
        clipper: ShapedBox(),
        child: SizedBox(
          height: SizeUtils.getHeight(50),
          width: SizeUtils.getWidth(180),
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: AppColors.tileGreenColor,
                padding: EdgeInsets.zero,
                primary: AppColors.white),
            onPressed: () {
              CommonNavigate(parentContext: context).navigateHomeScreen();
            },
            child: SvgPicture.asset(
              Utils.getAssetSvg("next"),
              color: AppColors.black,
              fit: BoxFit.cover,
              height: SizeUtils.getHeight(14),
              width: SizeUtils.getWidth(7),
            ),
          ),
        ),
      ),
    );
  }
}

class ShapedBox extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 177;
    final double _yScaling = size.height / 48;
    path.lineTo(0 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      177 * _xScaling,
      0 * _yScaling,
      177 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      177 * _xScaling,
      0 * _yScaling,
      177 * _xScaling,
      0 * _yScaling,
      177 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      151.215 * _xScaling,
      0 * _yScaling,
      144.952 * _xScaling,
      48 * _yScaling,
      119.167 * _xScaling,
      48 * _yScaling,
    );
    path.cubicTo(
      119.167 * _xScaling,
      48 * _yScaling,
      57.389 * _xScaling,
      48 * _yScaling,
      57.389 * _xScaling,
      48 * _yScaling,
    );
    path.cubicTo(
      31.6047 * _xScaling,
      48 * _yScaling,
      25.7843 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
      0 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
