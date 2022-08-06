import 'package:cashqwik/app/contracts/base_service.dart';
import 'package:cashqwik/core/models/api_models/api_action_status_message.dart';
import 'package:cashqwik/core/models/api_models/api_status_message.dart';
import 'package:cashqwik/utility/common/common_navigate.dart';
import 'package:cashqwik/utility/common/show_toast.dart';
import 'package:cashqwik/utility/components/footer_button.dart';
import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:flutter/material.dart';

import '../components/custom_circular_loader.dart';

/*class ServerErrorDialog extends BaseService {
  final BuildContext parentContext;

  ServerErrorDialog({required this.parentContext});

  double screenHeight = SizeUtils.getScreenHeight();
  double screenWidth = SizeUtils.getScreenWidth();
  bool _isLoading = false;

  show() {
    return showDialog(
        context: parentContext,
        useSafeArea: true,
        useRootNavigator: false,
        barrierDismissible: true,
        builder: (context) => WillPopScope(
              onWillPop: () async => false,
              child: StatefulBuilder(
                builder: (BuildContext parentContext, StateSetter setState) {
                  return SimpleDialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      title: Text(
                        "Server Error",
                        style: FontUtils.getFont16Style(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor),
                      ),
                      titlePadding: EdgeInsets.only(
                          top: screenHeight * .035,
                          left: screenWidth * .07,
                          right: screenWidth * .07),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: screenWidth * .07,
                          vertical: screenHeight * .03),
                      children: [
                        Column(
                          children: [
                            Text(
                              "Unable to connect to the server. Please try again.",
                              style: FontUtils.getFont12Style(
                                  color: AppColors.black),
                            ),
                            SizedBox(height: screenHeight * .03),
                            _isLoading
                                ? const CustomCircularLoader()
                                : FooterButton(
                                    label: "Retry",
                                    color: AppColors.secondaryColor,
                                    onTap: () {
                                      _checkConnection(setState);
                                    },
                                  )
                          ],
                        )
                      ]);
                },
              ),
            ));
  }

  _checkConnection(StateSetter setState) async {
    setState(() {
      _isLoading = true;
    });
    ApiActionStatusMessageModel res = await appApiRepo.checkServerApi();
    setState(() {
      _isLoading = false;
    });
    if (res.status!) {
      Navigator.popUntil(parentContext, (route) => route.isFirst);
      CommonNavigate(parentContext: parentContext).navigateSplashScreen();
    } else {
      ShowToast(
              title: "",
              message: "Please contact service provider",
              parentContext: parentContext)
          .show();
    }
  }
}*/
