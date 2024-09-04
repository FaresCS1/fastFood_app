import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../colors/appColors.dart';
import '../../../dimensions/myDimensions.dart';

class SuccessDialog extends StatelessWidget {
  final String content;
  final dynamic route;
  final String title;
  final String textButton;
  final IconData icon;
  final Color color;
  const SuccessDialog(
      {super.key,
      required this.content,
      this.route,
      required this.title,
      required this.textButton,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon, color: AppColors.whiteColor, size: 100),
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: dimensionFontSize(25),
                    fontStyle: FontStyle.italic,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    content,
                    style: TextStyle(
                      color: AppColors.grayColor,
                      fontSize: dimensionFontSize(18),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(color),
                  ),
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(route, (route) => false);
                    });
                  },
                  child: Text(
                    textButton,
                    style: const TextStyle(color: AppColors.whiteColor),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
