import 'package:flutter/cupertino.dart';
import 'package:untitled2/core/colors/appColors.dart';

Widget pointText(String text) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('\u2022 ', style: TextStyle(fontSize: 18)), // Bullet point
        Expanded(
            child: Text(
          text,
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 18,
          ),
        )), // Text content
      ],
    ),
  );
}
