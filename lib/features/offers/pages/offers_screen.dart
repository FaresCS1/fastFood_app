import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/shered_widget/Icon_button/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/bottomBar/provider/bottomBar_provider.dart';
import 'package:untitled2/features/offers/widget/offersWidget.dart';

import '../../../core/routes/myRoutes.dart';
import '../../../core/shered_widget/bottomBar/widget/bottomBar.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          leading: backIcon(),
          title: const Text("Offers"),
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: AppColors.orangeColor,
              fontSize: dimensionFontSize(28),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: OffersWidget(
              dirHorizontal: false,
            )));
  }
}
