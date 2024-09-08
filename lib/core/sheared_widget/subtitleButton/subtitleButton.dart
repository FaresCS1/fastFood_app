import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

class SubTitleButton extends StatelessWidget {
  final String text;
  final String route;
  const SubTitleButton({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
              color: AppColors.orangeColor, fontSize: dimensionFontSize(20)),
        ),
        TextButton(
            onPressed: () => Navigator.of(context)
                .pushNamed(route, arguments: text == "Meals" ? "Meals" : "All"),
            child: Text("all $text",
                style: TextStyle(
                    color: AppColors.grayColor,
                    fontSize: dimensionFontSize(18))))
      ],
    );
  }
}
