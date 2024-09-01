import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/provider/bottomBar_provider.dart';
import 'package:untitled2/features/offers/widget/offersWidget.dart';

import '../../core/constants/myRoutes.dart';
import '../../core/shered_widget/bottomBar/bottomBar.dart';

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FirebaseAuth.instance.currentUser != null
            ? InkWell(
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushNamed(cartRoute);
                  });
                },
                child: Container(
                  height: dimensionHeight(0.15),
                  width: dimensionWidth(0.15),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.orangeColor,
                  ),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: AppColors.whiteColor,
                    size: dimensionWidth(0.10),
                  ),
                ),
              )
            : null,
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          leading: Container(),
          title: const Text("Offers"),
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: AppColors.orangeColor,
              fontSize: dimensionFontSize(28),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: dimensionHeight(0.75),
                padding: EdgeInsets.all(20),
                child: OffersWidget(
                  dirHorizontal: false,
                )),
            ChangeNotifierProvider(
                create: (_) => BottomBarProvider(),
                child: Consumer<BottomBarProvider>(
                    builder: (context, bottomBarProvider, _) {
                  return Builder(builder: (context) {
                    bottomBarProvider.Index = 1;
                    return myBottombar(bottomBarProvider, context);
                  });
                }))
          ],
        ));
  }
}
