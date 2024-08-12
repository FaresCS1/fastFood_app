import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../colors/appColors.dart';

class FillButton extends StatelessWidget {
  final dynamic route;
  final String text;
  final IconData icon;

  const FillButton(
      {super.key, required this.text, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: () {
          WidgetsBinding.instance!.addPostFrameCallback((_) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => route),
            );
          });
        },
        child: Container(
          padding: const EdgeInsets.all(10),
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
                style: const TextStyle(
                    color: AppColors.bgColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 25),
              ),
              const SizedBox(
                width: 10,
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
