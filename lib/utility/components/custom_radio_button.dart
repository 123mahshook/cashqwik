import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomRadioButton extends StatefulWidget {
  final String? price;
  final int? selected;
  const CustomRadioButton({Key? key, this.price, this.selected})
      : super(key: key);

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Container(
            height: SizeUtils.getHeight(16),
            width: SizeUtils.getWidth(16),
            decoration: BoxDecoration(
                color: AppColors.trendLightGreen1,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.trendLightGreen1)),
            child: SvgPicture.asset(
              Utils.getAssetSvg("tick"),
              color: AppColors.white,
              height: SizeUtils.getHeight(16),
            ),
          ),
          horizontalSpace(8),
          Text(
            widget.price!,
            style: FontUtils.getFont12Style(
                color: AppColors.black, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
