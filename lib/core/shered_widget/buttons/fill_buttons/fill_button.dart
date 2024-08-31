import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import '../../../colors/appColors.dart';

class FillButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final String route;

  const FillButton(
      {super.key, required this.text, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Container(
          padding: EdgeInsets.all(dimensionWidth(0.03)),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: [
                  AppColors.lightRedColor,
                  AppColors.midOrangeColor,
                  AppColors.lightOrangeColor
                ],
                tileMode: TileMode.mirror),
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                    color: AppColors.bgColor,
                    fontWeight: FontWeight.w500,
                    fontSize: dimensionFontSize(20)),
              ),
              SizedBox(
                width: dimensionWidth(0.06),
              ),
              Icon(
                icon,
                color: AppColors.bgColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
