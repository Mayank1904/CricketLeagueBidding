import 'package:flutter/material.dart';

Widget chip(String label, Color color) {
  // Use FilterChip for filteration
  return ActionChip(
    labelPadding: const EdgeInsets.all(5.0),
    label: Text(
      label,
      style: const TextStyle(
        fontSize: 12.0,
        color: Colors.white,
      ),
    ),
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey[60],
    onPressed: () {},
  );
}
