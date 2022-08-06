import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class SearchField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool autofocus;
  final bool? readOnly;
  final double _buttonSize = 20;
  final Function()? onTap;
  final Function(String)? onSubmitData;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  const SearchField({
    Key? key,
    this.hintText,
    this.autofocus = false,
    this.controller,
    this.onSubmitData,
    this.onChanged,
    this.onFieldSubmitted,
    this.readOnly,
    this.onTap,
  }) : super(key: key);

  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: FontUtils.getFont14Style(
          color: AppColors.iconGrey, fontWeight: FontWeight.w500),
      autofocus: widget.autofocus,
      readOnly: widget.readOnly ?? false,
      enabled: true,
      onTap: widget.onTap,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
      textAlign: TextAlign.left,
      cursorHeight: SizeUtils.getHeight(20),
      cursorColor: AppColors.black,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          isDense: true,
          isCollapsed: true,
          counter: const SizedBox(),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
                left: SizeUtils.getWidth(10), right: SizeUtils.getWidth(7)),
            child: InkWell(
                onTap: () async {
                  await widget.onSubmitData!(widget.controller!.text);
                },
                child: SvgPicture.asset(
                  Utils.getAssetSvg("ic_searchbox"),
                  color: AppColors.iconGrey,
                  height: SizeUtils.getHeight(18),
                )),
          ),
          prefixIconConstraints: BoxConstraints(
              maxHeight: SizeUtils.getHeight(50),
              maxWidth: SizeUtils.getHeight(50),
              minHeight: SizeUtils.getHeight(20),
              minWidth: SizeUtils.getHeight(20)),
          // suffixIcon: ,
          // suffixIconConstraints: BoxConstraints(
          //     minHeight: SizeUtils.getHeight(32),
          //     minWidth: SizeUtils.getHeight(32),
          //     maxHeight: SizeUtils.getHeight(32),
          //     maxWidth: SizeUtils.getWidth(32)),
          // suffix: suffixBtn(),
          contentPadding: EdgeInsets.symmetric(
              vertical: SizeUtils.getHeight(12),
              horizontal: SizeUtils.getWidth(20)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(5))),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(5))),
          errorStyle: const TextStyle(fontFamily: "PlusJakartaSans"),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(5))),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(SizeUtils.getRadius(5))),
          //labelText: label,
          //labelStyle: TextStyle(color: AppColors.ONBORDING_TXT_COLOR),
          //floatingLabelBehavior: FloatingLabelBehavior.always,
          // hintText: hint,
          hintText: widget.hintText,
          hintStyle: FontUtils.getFont12Style(color: AppColors.iconGrey)),
    );
  }
}








// prefixIconConstraints: BoxConstraints(
//               maxHeight: SizeUtils.getHeight(16),
//               minHeight: SizeUtils.getHeight(10),
//               maxWidth: SizeUtils.getWidth(16),
//               minWidth: SizeUtils.getWidth(10)),
//           fillColor: AppColors.textFieldfillColor,
//           filled: true,
//           contentPadding: EdgeInsets.symmetric(
//               horizontal: SizeUtils.getWidth(10),
//               vertical: SizeUtils.getHeight(5)),
//           prefix: SvgPicture.asset(Utils.getAssetSvg("ic_itemsearch"),
//               height: SizeUtils.getHeight(20)),
//           focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.grey),
//               borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
//           border: OutlineInputBorder(
//               borderSide: BorderSide(color: AppColors.grey),
//               borderRadius: BorderRadius.circular(SizeUtils.getRadius(8))),
          // enabledBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: AppColors.grey),
          //     borderRadius: BorderRadius.circular(SizeUtils.getRadius(8)))