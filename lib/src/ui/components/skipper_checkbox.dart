import 'package:flutter/material.dart';
import 'package:skipper11/src/resources/constants/colors.dart';

class SkipperCheckBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final String? label;
  const SkipperCheckBox(
      {Key? key, required this.value, this.label, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged!(!value);
      },
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.white,
            checkColor: AppColor.black,
            value: value,
            onChanged: onChanged != null
                ? (checked) => onChanged!(checked ?? false)
                : null,
          ),
          Text(label ?? ''),
        ],
      ),
    );
  }
}
