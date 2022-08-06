import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/no_glow_scroll_behaviour.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';

class HomeBgView extends StatefulWidget {
  const HomeBgView({
    Key? key,
  }) : super(key: key);

  @override
  HomeBgViewState createState() => HomeBgViewState();
}

class HomeBgViewState extends State<HomeBgView> {
  ScrollController _scrollController = ScrollController();
  List<Color> colordt = [
    AppColors.tileHalfGreyColor,
    AppColors.tileGreenColor,
    AppColors.tileOrangeColor,
    AppColors.tileHalfBlueColor,
  ];

  List<Color> pickedColors = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo((2 * SizeUtils.getWidth(67)));
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  Color changeIndex() {
    int index = 0;
    Random random = Random();

    index = random.nextInt(5);
    return colordt[index];
  }

  setCategoryColors(int categoryLength) {
    do {
      for (var color in colordt) {
        if (pickedColors.length < categoryLength) {
          pickedColors.add(color);
        }
      }
    } while (pickedColors.length < categoryLength);
  }

  double opacity = 1;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: opacity,
        duration: Duration(milliseconds: 80),
        child: opacity == 0 ? SizedBox() : categoryListView());
  }

  setOpacity(double opac) {
    setState(() {
      opacity = opac;
    });
  }

  Widget categoryListView() {
    return SizedBox(
      height: SizeUtils.getHeight(180),
      width: SizeUtils.getScreenWidth(),
      child: ScrollConfiguration(
          behavior: NoGlowScrollBehaviour(),
          child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.only(
                  left: SizeUtils.getWidth(18), right: SizeUtils.getWidth(12)),
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                setCategoryColors(5);
                return categoryTile(index);
              })),
    );
  }

  Widget categoryTile(
    int index,
  ) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.only(right: SizeUtils.getWidth(10)),
      height: SizeUtils.getHeight(180),
      width: SizeUtils.getWidth(140),
      decoration: BoxDecoration(
          color: AppColors.white, //pickedColors[index - 1],
          borderRadius: BorderRadius.circular(SizeUtils.getRadius(18))),
      child: TextButton(
        style: TextButton.styleFrom(
            primary: pickedColors[index],
            padding: EdgeInsets.only(
                right: SizeUtils.getWidth(12),
                top: SizeUtils.getHeight(12),
                left: SizeUtils.getWidth(12)),
            backgroundColor: pickedColors[index].withOpacity(0.7),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18))),
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: SizeUtils.getHeight(6)),
                  child: AutoSizeText(
                    index % 2 != 0 ? "Owe me" : "I owe",
                    minFontSize: 9,
                    maxLines: 2,
                    style: FontUtils.getFont12Style(
                        color: AppColors.white.withOpacity(0.5)),
                  ),
                ),
                Spacer(),
                Container(
                  height: SizeUtils.getHeight(48),
                  width: SizeUtils.getWidth(48),
                  decoration: BoxDecoration(
                      // color: AppColors.black.withOpacity(0.5),
                      shape: BoxShape.circle),
                  child: Image.asset(
                    Utils.getAssetPng(index % 2 == 0
                        ? "f_top_right_arrow"
                        : "f_bottom_right_arrow"),
                    color: AppColors.white.withOpacity(
                        0.18), //pickedColors[index].withOpacity(0.3),
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            verticalSpace(8),
            AutoSizeText(
              index % 2 != 0 ? "\$ 1 250" : "\$ 1 130",
              minFontSize: 9,
              maxLines: 2,
              style: FontUtils.getFont24Style(
                  color: AppColors.white, fontWeight: FontWeight.w400),
            ),
            verticalSpace(8),
            AutoSizeText(
              "2 debts",
              minFontSize: 9,
              maxLines: 2,
              style: FontUtils.getFont12Style(
                  color: AppColors.white.withOpacity(0.5)),
            ),
          ],
        ),
      ),
    );
    // );
  }
}
