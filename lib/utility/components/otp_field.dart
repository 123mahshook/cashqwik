import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String)? onCompleted;
  const OtpField({Key? key, this.controller, this.onCompleted})
      : super(key: key);

  @override
  OtpFieldState createState() => OtpFieldState();
}

class OtpFieldState extends State<OtpField> {
  var onTapRecognizer;
  //late StreamController<ErrorAnimationType> errorController;
  bool isEnabled = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.pop(context);
      };
    //errorController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  setFieldEnabled(bool isEnable) {
    setState(() {
      isEnabled = isEnable;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      enabled: isEnabled,
      enablePinAutofill: false,
      readOnly: true,
      length: 4,
      autoFocus: true,
      appContext: context,
      autoDisposeControllers: true,

      /* validator: (value) {
        if (value?.length != 4) {
          return "Please enter a valid otp";
        }
      },*/
      controller: widget.controller,
      onCompleted: widget.onCompleted,
      textStyle: FontUtils.getFont24Style(color: AppColors.black),
      onChanged: (value) {},
      errorTextSpace: SizeUtils.getHeight(26),
      blinkDuration: const Duration(milliseconds: 1),
      animationType: AnimationType.fade,
      pastedTextStyle: FontUtils.getFont24Style(),
      keyboardType: TextInputType.number,
      pinTheme: PinTheme(
          disabledColor: AppColors.grey.withOpacity(0.2),
          borderWidth: SizeUtils.getHeight(0),
          shape: PinCodeFieldShape.box,
          activeColor: AppColors.grey,
          activeFillColor: AppColors.grey,
          inactiveFillColor: AppColors.grey.withOpacity(0.6),
          selectedFillColor: AppColors.grey,
          fieldHeight: SizeUtils.getHeight(50),
          fieldWidth: SizeUtils.getHeight(50),
          selectedColor: AppColors.grey,
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(8)),
          inactiveColor: AppColors.grey),
      backgroundColor: AppColors.transparent,
      cursorColor: AppColors.black,
      cursorHeight: SizeUtils.getHeight(15),
      enableActiveFill: true,
    );
  }
}
