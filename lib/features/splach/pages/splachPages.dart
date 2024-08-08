import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/features/entry/pages/choose_entry/chooseEntry.dart';

import '../../../core/shered_widget/logo/logo.dart';

class Splachpage extends StatefulWidget {
  Splachpage({super.key});

  @override
  State<Splachpage> createState() => _SplachpageState();
}

class _SplachpageState extends State<Splachpage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ChooseEntry()),
            ));
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [AppColors.lightOrangeColor, AppColors.midOrangeColor],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: Center(child: appLogoWhite(500, 500)),
    ));
  }
}
