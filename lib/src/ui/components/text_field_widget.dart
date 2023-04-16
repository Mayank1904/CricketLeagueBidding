import 'package:flutter/material.dart';
import 'package:skipper11/src/resources/constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintValue;
  final Function? onChanged;
  const TextFieldWidget(
      {super.key, this.hintValue, this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: TextAlign.start,
      controller: controller,
      keyboardType: TextInputType.text,
      style: const TextStyle(
          fontSize: 16.0, color: AppColors.black, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintValue ?? '',
        hintStyle: const TextStyle(
            backgroundColor: Colors.white,
            color: Color(0xffa3a3a3),
            fontWeight: FontWeight.w400,
            fontFamily: "Graphik",
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        contentPadding: const EdgeInsets.all(16.0),
      ),
      onChanged: (value) => onChanged,
    );
  }
}
