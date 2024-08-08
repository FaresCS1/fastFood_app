import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../features/home/pages/home_screen.dart';

class DialogApp extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String textButton;
  final dynamic route;
  const DialogApp(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.textButton,
      this.route});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Icon(
        icon,
        color: color,
        size: 80,
      ),
      actions: [
        MaterialButton(
          child: Container(
            height: 60,
            width: 150,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(textButton),
            ),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => route));
          },
        )
      ],
    );
  }
}
