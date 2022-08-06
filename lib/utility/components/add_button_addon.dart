import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:flutter/material.dart';

import '../values/font_utils.dart';

class AddButtonAddOn extends StatefulWidget {
  final Function()? onpressed;
  // final double? height;
  // final double? width;
  final Function(int)? reloaddbItem;
  final bool isLarge;

  const AddButtonAddOn(
      {Key? key, this.onpressed, this.isLarge = false, this.reloaddbItem})
      : super(key: key);

  @override
  State<AddButtonAddOn> createState() => _AddButtonAddOnState();
}

class _AddButtonAddOnState extends State<AddButtonAddOn> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.isLarge
          ? SizeUtils.getHeight(25)
          : SizeUtils.getHeight(25), //25
      width:
          widget.isLarge ? SizeUtils.getWidth(65) : SizeUtils.getWidth(70), //45
      child: quantity == 0 ? SizedBox() : quantitybtn(),
    );
  }

  Widget quantitybtn() {
    return Container(
      height: SizeUtils.getHeight(25),
      width: SizeUtils.getWidth(85),
      decoration: BoxDecoration(
          color: AppColors.trendLightGreen1,
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: SizeUtils.getWidth(20),
            child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  setState(() {
                    quantity--;
                    // print(quantity);
                    widget.reloaddbItem!(quantity);
                  });
                },
                child: Text(
                  "-",
                  style: FontUtils.getFont14Style(
                      color: AppColors.white, fontWeight: FontWeight.w700),
                )),
          ),
          Text(
            quantity.toString(),
            style: FontUtils.getFont12Style(
                color: AppColors.white, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            width: SizeUtils.getWidth(20),
            child: TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  setState(() {
                    quantity++;
                    // print(quantity);
                    widget.reloaddbItem!(quantity);
                  });
                },
                child: Text(
                  "+",
                  style: FontUtils.getFont14Style(
                      color: AppColors.white, fontWeight: FontWeight.w700),
                )),
          )
        ],
      ),
    );
  }
}
