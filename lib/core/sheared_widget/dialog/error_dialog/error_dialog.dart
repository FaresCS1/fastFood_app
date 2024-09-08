import 'package:flutter/material.dart';
import '../../../colors/appColors.dart';
import '../../../dimensions/myDimensions.dart';

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
            padding: const EdgeInsets.symmetric(vertical: 20),
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
