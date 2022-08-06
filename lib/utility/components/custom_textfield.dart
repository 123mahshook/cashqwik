import 'package:flutter/material.dart';
import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.label,
      this.controller,
      this.errorMessage,
      this.keyboardType,
      this.obscureText,
      this.textCapitalization,
      this.onTap,
      this.readOnly,
      this.maxLines,
      this.textInputAction,
      this.hint,
      this.autoFocus,
      this.enabled,
      this.maxLength,
      this.suffix,
      this.prefix,
      this.validator,
      this.style,
      this.onChanged});
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function? validator;
  final bool? obscureText;
  final String? errorMessage;
  final TextCapitalization? textCapitalization;
  final bool? readOnly;
  final Function? onTap;
  final int? maxLines;
  final bool? autoFocus;
  final String? hint;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final int? maxLength;
  final Widget? suffix;
  final Widget? prefix;
  final TextStyle? style;
  final Function(String)? onChanged;
  final double _iconSize = 22;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeUtils.getHeight(5)),
      child: TextFormField(
        readOnly: readOnly ?? false,
        enabled: enabled ?? true,
        textInputAction: textInputAction ?? TextInputAction.next,
        textCapitalization: textCapitalization ?? TextCapitalization.words,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        onTap: () {
          if (onTap != null) {
            onTap!();
          }
        },
        validator: (value) {
          if (validator != null && !validator!(value)) {
            return errorMessage ??
                "Please enter a valid " + label.toLowerCase();
          }
          return null;
        },
        style: style ??
            FontUtils.getFont14Style(
                color: AppColors.black, fontWeight: FontWeight.w600),
        obscureText: obscureText ?? false,
        controller: controller,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        obscuringCharacter: '*',
        keyboardType: keyboardType,
        cursorColor: AppColors.primaryColor,
        decoration: InputDecoration(
            filled: true,
            isDense: true,
            counter: SizedBox(),
            fillColor: AppColors.textFieldfillColor,
            suffixIcon: suffix,
            prefixIconConstraints: BoxConstraints(
              maxHeight: SizeUtils.getHeight(_iconSize),
              maxWidth: SizeUtils.getHeight(_iconSize + 60),
              minHeight: SizeUtils.getHeight(_iconSize),
              minWidth: SizeUtils.getHeight(_iconSize + 60),
            ),
            prefixIcon: prefix,
            contentPadding: EdgeInsets.symmetric(
                vertical: SizeUtils.getHeight(10),
                horizontal: SizeUtils.getWidth(10)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  BorderSide(color: AppColors.primaryColor.withOpacity(0.3)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.red),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: AppColors.textFieldBorder),
            ),
            errorStyle: FontUtils.getFont12Style(color: Colors.red),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: AppColors.textFieldBorder.withOpacity(0.3))),
            hintText: hint,
            /*labelText: label == "" ? null : label,
            labelStyle: FontUtils.getFont12Style(
                fontWeight: FontWeight.w500,
                color: AppColors.iconGrey.withOpacity(0.6)),*/
            //floatingLabelBehavior: FloatingLabelBehavior.always,
            hintStyle: FontUtils.getFont12Style(
                fontWeight: FontWeight.w500,
                color: AppColors.iconGrey.withOpacity(0.6))),
      ),
    );
  }
}
/*class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.label,
      this.controller,
      this.errorMessage,
      this.keyboardType,
      this.obscureText = false,
      this.textCapitalization,
      this.onTap,
      this.readOnly,
      this.maxLines,
      this.textInputAction,
      this.hint,
      this.autoFocus,
      this.enabled,
      this.maxLength,
      this.suffix,
      this.validator,
      this.onChanged})
      : super(key: key);
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final Function? validator;
  final bool obscureText;
  final String? errorMessage;
  final TextCapitalization? textCapitalization;
  final bool? readOnly;
  final Function? onTap;
  final int? maxLines;
  final bool? autoFocus;
  final String? hint;
  final TextInputAction? textInputAction;
  final bool? enabled;
  final int? maxLength;
  final Widget? suffix;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: SizeUtils.getHeight(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            // style: FontUtils.getFont13Style(),
          ),
          verticalSpace(7),
          TextFormField(
            readOnly: readOnly ?? false,
            enabled: enabled ?? true,
            textInputAction: textInputAction ?? TextInputAction.next,
            textCapitalization: textCapitalization ?? TextCapitalization.words,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: onChanged,
            onTap: () {
              if (onTap != null) {
                onTap!();
              }
            },
            validator: (value) {
              if (validator != null && !validator!(value)) {
                return errorMessage ??
                    "Please enter a valid " + label.toLowerCase();
              }
              return null;
            },
            style: FontUtils.getFont18Style(
                color: AppColors.black, fontWeight: FontWeight.w400),
            obscureText: obscureText,
            controller: controller,
            maxLines: maxLines ?? 1,
            maxLength: maxLength,
            obscuringCharacter: '*',
            keyboardType: keyboardType,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
                filled: true,
                isDense: true,
                counter: const SizedBox(),
                fillColor: AppColors.white,
                suffixIcon: suffix,
                suffixIconConstraints:
                    BoxConstraints(maxWidth: SizeUtils.getWidth(50)),
                contentPadding: EdgeInsets.symmetric(
                    vertical: SizeUtils.getHeight(15),
                    horizontal: SizeUtils.getWidth(20)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.primaryColor),
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(10))),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.red),
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(10))),
                errorStyle: const TextStyle(fontFamily: "PlusJakartaSans"),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.transparent),
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(10))),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.transparent),
                    borderRadius:
                        BorderRadius.circular(SizeUtils.getRadius(10))),
                //labelText: label,
                //labelStyle: TextStyle(color: AppColors.ONBORDING_TXT_COLOR),
                //floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: hint,
                hintStyle: FontUtils.getFont18Style(color: AppColors.black)),
          ),
        ],
      ),
    );
  }
}*/
