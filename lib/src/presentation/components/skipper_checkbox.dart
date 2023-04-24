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
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 16.0,
            width: 16.0,
            child: Checkbox(
              fillColor: MaterialStateProperty.resolveWith(getColor),
              checkColor: AppColors.black,
              value: value,
              onChanged: onChanged != null
                  ? (checked) => onChanged!(checked ?? false)
                  : null,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: RichText(
                text: const TextSpan(children: [
              TextSpan(
                  style: TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w400,
                      fontFamily: "Graphik",
                      fontStyle: FontStyle.normal,
                      fontSize: 13.0),
                  text: "By registering, I agree to My Fantasy 11’s "),
              TextSpan(
                  style: TextStyle(
                      color: AppColors.yellow,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Graphik",
                      fontStyle: FontStyle.normal,
                      fontSize: 13.0),
                  text: "T&Cs")
            ])),
          ),
        ],
      ),
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.selected,
      MaterialState.focused,
      MaterialState.pressed,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.pink;
  }
}
