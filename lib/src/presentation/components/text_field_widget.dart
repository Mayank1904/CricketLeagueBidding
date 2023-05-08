import 'package:flutter/material.dart';
import '../../resources/constants/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintValue;
  final Function? onChanged;
  final bool isNumeric;
  const TextFieldWidget(
      {super.key,
      this.hintValue,
      this.controller,
      this.onChanged,
      required this.isNumeric});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: isNumeric ? TextInputType.phone : TextInputType.text,
      maxLength: isNumeric ? 10 : 20,
      style: const TextStyle(
        fontSize: 16.0,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        isCollapsed: true,
        filled: true,
        fillColor: Colors.white,
        hintText: hintValue ?? '',
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 0.0),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(0.0),
          ),
        ),
        hintStyle: const TextStyle(
            backgroundColor: Colors.white,
            color: Color(0xffa3a3a3),
            fontWeight: FontWeight.w400,
            fontFamily: "Graphik",
            fontStyle: FontStyle.normal,
            fontSize: 16.0),
        contentPadding: const EdgeInsets.all(16.0),
        isDense: true,
      ),
      onChanged: (value) => onChanged!(value),
    );
  }
}
