import 'package:flutter/material.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

import '../../../../colors/appColors.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback function;

  const AuthButton(
      {super.key,
      required this.text,
      required this.icon,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: function,
        child: text == "Sign Out"
            ? Icon(
                icon,
                color: AppColors.redColor,
                size: dimensionWidth(0.08),
              )
            : Container(
                padding: EdgeInsets.all(dimensionWidth(0.03)),
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      text,
                      style: TextStyle(
                          color: AppColors.orangeColor,
                          fontWeight: FontWeight.w500,
                          fontSize: dimensionFontSize(20)),
                    ),
                    SizedBox(
                      width: dimensionWidth(0.06),
                    ),
                    Icon(
                      icon,
                      color: AppColors.orangeColor,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
