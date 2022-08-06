import 'package:flutter/material.dart';
import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/size_utils.dart';

class FontUtils {
  static TextStyle getFont9Style(
      {Color color = AppColors.offerColor2,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(9),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight);
  }

  static TextStyle getFont10Style(
      {Color color = AppColors.lightGrey,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(10),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight);
  }

  static TextStyle getFont11Style(
      {Color color = AppColors.offerColor2,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(11),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight);
  }

  static TextStyle getFont12Style(
      {Color color = AppColors.fonttGrey,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(12),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight);
  }

  static TextStyle getFont13Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(13),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight);
  }

  static TextStyle getFont14Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(14),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight);
  }

  static TextStyle getFont15Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(15),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight);
  }

  static TextStyle getFont16Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w700,
      TextDecoration decoration = TextDecoration.none}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(16),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight,
        decoration: decoration);
  }

  static TextStyle getFont14CouponStyle(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w700,
      TextDecoration decoration = TextDecoration.none}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(14),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight,
        decoration: decoration);
  }

  static TextStyle getFont18Style(
      {Color color = AppColors.numberBlack,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(18),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight);
  }

  static TextStyle getFont20Style(
      {Color color = AppColors.numberBlack,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(20),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight);
  }

  static TextStyle getFont24Style(
      {Color color = AppColors.white,
      FontWeight fontWeight = FontWeight.w700}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(24),
        fontFamily: "Airbnb Cereal",
        fontWeight: fontWeight);
  }

  static TextStyle getFont30Style({Color color = AppColors.primaryColor}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(30),
        fontFamily: "Airbnb Cereal",
        fontWeight: FontWeight.w500);
  }

  static TextStyle getFont36Style({Color color = AppColors.white}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(36),
        fontFamily: "Airbnb Cereal",
        fontWeight: FontWeight.w500);
  }

  static TextStyle get64SplashFont(
      {Color color = AppColors.primaryColor,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
        color: color,
        fontSize: SizeUtils.getFont(64),
        fontFamily: "Home Gold",
        fontWeight: fontWeight);
  }
}
