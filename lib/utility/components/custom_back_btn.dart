import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({Key? key, this.onTap, this.color, this.iconColor})
      : super(key: key);
  final Color? color;
  final Color? iconColor;
  final Function()? onTap;

  @override
  _CustomBackButtonState createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  Size btnSize = Size(SizeUtils.getHeight(25), SizeUtils.getHeight(25));
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: SizeUtils.getHeight(30),
        width: SizeUtils.getHeight(30),
        child: TextButton(
            style: TextButton.styleFrom(
                elevation: 1,
                alignment: Alignment.center,
                primary: AppColors.black,
                shape: const CircleBorder(),
                padding: EdgeInsets.zero,
                backgroundColor: widget.color ?? AppColors.white,
                fixedSize: btnSize,
                tapTargetSize: MaterialTapTargetSize.padded,
                minimumSize: btnSize,
                maximumSize: btnSize),
            onPressed: widget.onTap ??
                () {
                  Navigator.pop(context);
                },
            child: SvgPicture.asset(
              Utils.getAssetSvg("ic_backarrow"),
              // color: widget.color ?? AppColors.iconGrey,
              fit: BoxFit.cover,
              color: AppColors.fonttGrey,
              alignment: Alignment.center,
            )),
      ),
    );
  }
}
