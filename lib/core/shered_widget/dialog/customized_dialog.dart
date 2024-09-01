import 'package:flutter/material.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

import '../../../core/colors/appColors.dart';

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

class ConfirmDialog extends StatelessWidget {
  final String content;
  final VoidCallback fun;
  final String title;
  final String textButton;
  final IconData icon;
  final Color color;
  final dynamic route;
  const ConfirmDialog({
    super.key,
    required this.content,
    required this.fun,
    required this.title,
    required this.textButton,
    required this.icon,
    required this.color,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: AppColors.lightGrayColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon, color: color, size: 100),
                Text(
                  title,
                  style: TextStyle(
                    color: color,
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
                      color: AppColors.blackColor,
                      fontSize: dimensionFontSize(18),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(color),
                      ),
                      onPressed: () {
                        fun();
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
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Close",
                        style: const TextStyle(color: AppColors.blackColor),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  final String content;
  final dynamic route;
  final String title;
  final IconData? icon;
  final Color? color;
  final String? textButton;
  const ErrorDialog({
    super.key,
    required this.content,
    this.route,
    required this.title,
    this.icon,
    this.color,
    this.textButton,
  });

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
              color: color == null ? AppColors.redColor : color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(icon == null ? Icons.error : icon!,
                    color: AppColors.whiteColor, size: 100),
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
                    backgroundColor: WidgetStatePropertyAll(
                        color == null ? AppColors.redColor : color),
                  ),
                  onPressed: () {
                    route == null
                        ? Navigator.of(context).pop()
                        : Navigator.of(context)
                            .pushNamedAndRemoveUntil(route, (route) => false);
                  },
                  child: Text(
                    textButton == null ? "Close" : textButton!,
                    style: TextStyle(color: AppColors.whiteColor),
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
