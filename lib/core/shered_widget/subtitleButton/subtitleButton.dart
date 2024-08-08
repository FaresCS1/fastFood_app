import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';

class Subtitlebutton extends StatelessWidget {
  final String text;
  final dynamic route;
  const Subtitlebutton({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(color: AppColors.orangeColor, fontSize: 20),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => route));
              },
              child: Text("all ${text}",
                  style: TextStyle(color: AppColors.grayColor, fontSize: 18)))
        ],
      ),
    );
  }
}
