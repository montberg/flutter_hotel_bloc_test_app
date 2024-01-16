import 'package:flutter/material.dart';

import '../../themes/colors.dart';

class TagWidget extends StatelessWidget {
  const TagWidget(
    this.label, {
    super.key,
  });
  final String label;
  @override
  Widget build(BuildContext context) {
    return Chip(
        label: Text(
          label,
          style: const TextStyle(
              color: Color(0xff828796),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        backgroundColor: backgroundColor);
  }
}