import 'package:auto_size_text/auto_size_text.dart';
import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceFooterButton extends StatelessWidget {
  final String label;
  final String? price;
  final Function()? onpressed;
  final Color? color;
  final String? item;
  const PriceFooterButton(
      {Key? key,
      required this.label,
      this.item,
      this.color,
      this.onpressed,
      this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeUtils.getHeight(55),
      width: SizeUtils.getScreenWidth(),
      child: TextButton(
        style: TextButton.styleFrom(
            alignment: Alignment.center,
            primary: AppColors.black,
            padding: EdgeInsets.symmetric(horizontal: SizeUtils.getHeight(16)),
            backgroundColor: color ?? AppColors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    item ?? "Items total",
                    maxLines: 1,
                    minFontSize: 10,
                    style: FontUtils.getFont12Style(
                        color: AppColors.black, fontWeight: FontWeight.w600),
                  ),
                  AutoSizeText(
                    price!,
                    maxLines: 1,
                    minFontSize: 13,
                    style: FontUtils.getFont16Style(color: AppColors.black),
                  ),
                ],
              ),
            ),
            label == "View Cart"
                ? SvgPicture.asset(
                    Utils.getAssetSvg("ic_cart"),
                    color: AppColors.black,
                    height: SizeUtils.getHeight(24),
                  )
                : const SizedBox(),
            horizontalSpace(8),
            Text(label,
                style: FontUtils.getFont16Style(color: AppColors.black)),
          ],
        ),
      ),
    );
  }
}




// Container(
//       height: SizeUtils.getHeight(56),
//       width: SizeUtils.getScreenWidth(),
//       decoration: BoxDecoration(
//           color: AppColors.secondaryColor,
//           borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
//     )