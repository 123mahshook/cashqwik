import 'package:cashqwik/utility/values/app_colors.dart';
import 'package:cashqwik/utility/values/font_utils.dart';
import 'package:cashqwik/utility/values/size_utils.dart';
import 'package:cashqwik/utility/values/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  final Function(String) onChanged;
  const CustomDropDown({Key? key, required this.items, required this.onChanged})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String dropdownValue = '1KG';

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownValue,
      icon: SvgPicture.asset(
        Utils.getAssetSvg("dropdown"),
        fit: BoxFit.cover,
        color: AppColors.richTextViolet1,
      ),
      iconSize: SizeUtils.getHeight(16),
      alignment: Alignment.center,
      underline: Container(
        color: AppColors.white,
      ),
      style: FontUtils.getFont12Style(color: AppColors.richTextViolet1),
      items: widget.items /* <String>['1KG', '2KG', '3KG', '4KG'] */
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: FontUtils.getFont12Style(color: AppColors.richTextViolet1),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
        widget.onChanged.call(dropdownValue);
      },
    );
  }
}
