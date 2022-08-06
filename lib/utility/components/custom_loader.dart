import 'package:cashqwik/utility/components/custom_circular_loader.dart';
import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomLoader {
  final BuildContext pContext;
  CustomLoader(this.pContext);
  static bool _isShowing = false;

  Future<void> show() async {
    if (!_isShowing) {
      await _showLoader();
    }
  }

  Future<void> _showLoader() {
    _isShowing = true;
    return showDialog<void>(
        context: pContext,
        useSafeArea: true,
        useRootNavigator: false,
        barrierDismissible: false,
        barrierColor: AppColors.black.withOpacity(.3),
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Align(
              child: Container(
                height: SizeUtils.getHeight(80),
                width: SizeUtils.getHeight(85),
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getHeight(20))),
                child: Stack(
                  clipBehavior: Clip.antiAlias,
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      Utils.getAssetSvg("logo"),
                      height: SizeUtils.getHeight(8),
                    ),
                    CustomCircularLoader(
                      height: SizeUtils.getHeight(50),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  void hide() {
    if (_isShowing) {
      Navigator.of(pContext).pop();
      _isShowing = false;
    }
  }
}
