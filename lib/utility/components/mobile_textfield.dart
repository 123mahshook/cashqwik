import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MobileTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function()? onCleared;
  final Function? validator;
  const MobileTextField(
      {Key? key, this.controller, this.onCleared, this.validator})
      : super(key: key);
  final double _iconSize = 22;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: SizeUtils.getHeight(15),
          horizontal: SizeUtils.getWidth(12)),
      height: SizeUtils.getHeight(88),
      width: SizeUtils.getScreenWidth(),
      decoration: BoxDecoration(
          color: const Color(0xFFFFF9E9),
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(4))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Enter your phone number", style: FontUtils.getFont12Style()),
          SizedBox(
            height: SizeUtils.getHeight(8),
          ),
          Row(children: [
            /* Container(
              clipBehavior: Clip.antiAlias,
              height: SizeUtils.getHeight(24),
              width: SizeUtils.getWidth(24),
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Image.asset(Utils.getAssetPng("flag")),
            ),
            horizontalSpace(10),
            Padding(
              padding: EdgeInsets.only(right: SizeUtils.getWidth(5)),
              child: Text(
                "+60",
                style: FontUtils.getFont18Style(),
              ),
            ),*/
            loginTextField(),
            /* Padding(
              padding: EdgeInsets.only(bottom: SizeUtils.getHeight(4)),
              child: loginTextField(),
            ), */
            const Spacer(),
            SizedBox(
              height: SizeUtils.getHeight(30),
              width: SizeUtils.getWidth(30),
              child: IconButton(
                  onPressed: onCleared,
                  icon: SizedBox(
                    height: SizeUtils.getHeight(24),
                    width: SizeUtils.getWidth(24),
                    child: SvgPicture.asset(
                      Utils.getAssetSvg("ic_backclose"),
                      fit: BoxFit.cover,
                    ),
                  )),
            )
          ])
        ],
      ),
    );
  }

  Widget loginTextField() {
    return SizedBox(
      height: SizeUtils.getHeight(24),
      width: SizeUtils.getWidth(200 /*150*/),
      child: TextFormField(
        readOnly: true,
        showCursor: true,
        enabled: true,
        autofocus: true,
        controller: controller,
        keyboardType: TextInputType.number,

        /*validator: (value) {
          if (validator != null && !validator!(value)) {
            return "Please enter a valid phone number";
          }
          return null;
        },*/
        style: FontUtils.getFont18Style(),
        cursorColor: AppColors.numberBlack,
        decoration: InputDecoration(
          prefixIcon: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: SizeUtils.getHeight(24),
                width: SizeUtils.getWidth(24),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(Utils.getAssetPng("flag")),
              ),
              horizontalSpace(10),
              Padding(
                padding: EdgeInsets.only(right: SizeUtils.getWidth(5)),
                child: Text(
                  "+60",
                  style: FontUtils.getFont18Style(),
                ),
              ),
            ],
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: SizeUtils.getHeight(_iconSize),
            maxWidth: SizeUtils.getHeight(_iconSize + 60),
            minHeight: SizeUtils.getHeight(_iconSize),
            minWidth: SizeUtils.getHeight(_iconSize + 60),
          ),
          /*errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(color: Colors.red),
          ),
          errorStyle: FontUtils.getFont12Style(color: Colors.red),*/
          counter: const SizedBox(),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            // borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))
          ),
          contentPadding: EdgeInsets.zero,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            // borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))
          ),
        ),
      ),
    );
  }
}
