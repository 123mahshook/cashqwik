import 'package:flutter/material.dart';
import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';

class FooterButton extends StatelessWidget {
  const FooterButton(
      {Key? key,
      required this.label,
      required this.onTap,
      this.height,
      this.width,
      this.padding,
      this.primary,
      this.style,
      this.color})
      : super(key: key);
  final String label;
  final void Function() onTap;
  final Color? color;
  final double? height;
  final double? width;
  final TextStyle? style;
  final Color? primary;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    // bool isLoading = false
    return SizedBox(
      height: height ?? SizeUtils.getHeight(56),
      width: width ?? SizeUtils.getScreenWidth(),
      child: TextButton(
        style: TextButton.styleFrom(
            primary: primary ?? AppColors.black,
            padding: padding ??
                EdgeInsets.symmetric(
                    vertical: SizeUtils.getHeight(5),
                    horizontal: SizeUtils.getHeight(10)),
            backgroundColor: color ?? AppColors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: onTap,
        child: Text(label,
            style: style ?? FontUtils.getFont16Style(color: AppColors.black)),
      ),
    );
  }
}
