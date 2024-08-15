import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final dynamic route;
  const myTextButton(
      {super.key, required this.text, required this.color, this.route});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => route),
            );
          });
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: color,
          ),
        ));
  }
}
