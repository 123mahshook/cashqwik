import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:flutter/material.dart';

class ScrollIndicator extends StatefulWidget {
  final int totalCount;
  const ScrollIndicator({Key? key, required this.totalCount}) : super(key: key);

  @override
  ScrollIndicatorState createState() => ScrollIndicatorState();
}

class ScrollIndicatorState extends State<ScrollIndicator> {
  int currentIndex = 0;

  changedIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          widget.totalCount,
          (index) => Container(
                height: SizeUtils.getHeight(5),
                width: SizeUtils.getHeight(5),
                margin: EdgeInsets.only(
                    bottom: SizeUtils.getHeight(10),
                    right: SizeUtils.getWidth(5)),
                decoration: BoxDecoration(
                    color: currentIndex == index
                        ? AppColors.primaryColor
                        : AppColors.grey,
                    shape: BoxShape.circle),
              )),
    );
  }
}
