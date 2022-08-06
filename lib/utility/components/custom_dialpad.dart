import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDialPad extends StatelessWidget {
  final TextEditingController controller;
  final int maxLength;
  CustomDialPad({Key? key, required this.maxLength, required this.controller})
      : super(key: key);

  String inputString = "";

  @override
  Widget build(BuildContext context) {
    List<String> numbers = [
      "1",
      "2",
      "3",
      "4",
      "5",
      "6",
      "7",
      "8",
      "9",
      "",
      "0",
      "ic_backspace"
    ];
    return Container(
        // margin: EdgeInsets.symmetric(horizontal: SizeUtils.getWidth(20)),
        padding: EdgeInsets.symmetric(
            /* horizontal: SizeUtils.getHeight(10), */ vertical:
                SizeUtils.getHeight(24)),
        // height: SizeUtils.getHeight(250),
        width: SizeUtils.getScreenWidth(),
        decoration: BoxDecoration(
            color: const Color(0xFFFFF9E9),
            // AppColors.dialPad,
            borderRadius: BorderRadius.circular(8)), // SizeUtils.getRadius(8)
        child: Wrap(
            clipBehavior: Clip.antiAlias,
            runAlignment: WrapAlignment.start,
            runSpacing: SizeUtils.getHeight(12),
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: SizeUtils.getWidth(12),
            children: List.generate(numbers.length, (index) {
              if (index == 9) {
                return SizedBox(
                  height: SizeUtils.getHeight(40),
                  width: SizeUtils.getWidth(85),
                );
              } else if (index == 11) {
                return SizedBox(
                  height: SizeUtils.getHeight(40),
                  width: SizeUtils.getWidth(85),
                  child: TextButton(
                    style: TextButton.styleFrom(
                        alignment: Alignment.center,
                        /* shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(SizeUtils.getRadius(12))), */
                        backgroundColor: AppColors
                            .transparent, //const Color(0xFFC7DEE5).withOpacity(0.3),
                        primary: AppColors.primaryColor,
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeUtils.getWidth(14))),
                    onPressed: () {
                      _backspace();
                    },
                    child: SvgPicture.asset(
                      Utils.getAssetSvg(numbers[index]),
                      color: AppColors.black,
                      height: SizeUtils.getHeight(16),
                    ),
                  ),
                );
              } else {
                return SizedBox(
                  height: SizeUtils.getHeight(40),
                  width: SizeUtils.getWidth(85),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          /*      shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(SizeUtils.getRadius(12))), */
                          backgroundColor:
                              AppColors.transparent, // Color(0xFFC7DEE5)
                          // .withOpacity(0.3) /* AppColors.primaryColor.withOpacity(0.2) */,
                          primary: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeUtils.getWidth(40))),
                      onPressed: () {
                        if (controller.text.length < maxLength) {
                          _insertText(numbers[index]);
                        }
                      },
                      child: Text(
                        numbers[index],
                        style: FontUtils.getFont20Style(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500),
                      )),
                );
              }
            })));
  }

  void _insertText(String myText) {
    final text = controller.text;
    final textSelection = controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    controller.text = newText;
    controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = controller.text;
    final textSelection = controller.selection;
    final selectionLength =
        textSelection.end - textSelection.start; // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      controller.text = newText;
      controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    } // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    } // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    controller.text = newText;
    controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }

  clearInputString() {
    inputString = "";
  }
}
