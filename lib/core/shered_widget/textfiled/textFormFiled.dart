import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../colors/appColors.dart';

class TextField extends StatefulWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hinttext;
  late bool obscureText;

  TextField(
    this.icon,
    this.hinttext,
    this.obscureText,
    this.controller,
  );

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.obscureText,
          keyboardType: widget.hinttext == "phone"
              ? TextInputType.number
              : TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: Icon(
              widget.icon,
              color: AppColors.midOrangeColor,
              size: 28,
            ),
            suffixIcon: widget.hinttext == "password"
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        widget.obscureText = !widget.obscureText;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: AppColors.midOrangeColor,
                    ),
                  )
                : null,
            hintText: widget.hinttext,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ));
  }
}
