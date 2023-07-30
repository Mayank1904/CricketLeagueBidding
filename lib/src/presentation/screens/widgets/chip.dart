import 'package:flutter/material.dart';

import '../../../resources/constants/colors.dart';

Widget chip(String label, bool isSelected) {
  // Use FilterChip for filteration
  return ChoiceChip(
    selected: isSelected,
    labelPadding: const EdgeInsets.all(5.0),
    label: Text(
      label,
      style: TextStyle(
        fontSize: 12.0,
        color: isSelected ? Colors.black : AppColors.white,
      ),
    ),
    selectedColor: AppColors.greyF5,
    disabledColor: AppColors.yellow,
    backgroundColor: AppColors.transparent,
    elevation: 6.0,
    onSelected: (selected) {},
  );
}
