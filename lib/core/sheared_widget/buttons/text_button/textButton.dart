import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

class myTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final String route;
  const myTextButton(
      {super.key,
      required this.text,
      required this.color,
      required this.route});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          text.contains("Gust")
              ? Navigator.of(context)
                  .pushNamedAndRemoveUntil(route, (route) => false)
              : Navigator.of(context).pushNamed(route);
        },
        onHover: (value) =>
            const TextStyle(backgroundColor: AppColors.grayColor),
        child: Text(
          text,
          style: TextStyle(
            fontSize: dimensionFontSize(18),
            color: color,
          ),
        ));
  }
}
