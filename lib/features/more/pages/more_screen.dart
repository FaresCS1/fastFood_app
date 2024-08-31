import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/provider/bottomBar_provider.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/logo/logo.dart';

import '../../../core/constants/myRoutes.dart';
import '../../../core/models/moreInfo.dart';
import '../../../core/shered_widget/bottomBar/bottomBar.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FirebaseAuth.instance.currentUser != null
            ? InkWell(
                onTap: () {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
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
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          leading: Container(),
        ),
        backgroundColor: AppColors.bgColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: dimensionHeight(0.75),
              child: Column(
                children: [
                  SizedBox(
                    height: dimensionHeight(0.20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        appLogo(dimensionWidth(0.15), dimensionHeight(0.15)),
                        Text(
                          "Fast food \n faster smiles!",
                          style: TextStyle(
                              color: AppColors.lightOrangeColor,
                              fontSize: dimensionFontSize(28),
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: dimensionHeight(0.55),
                    child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: moreScreenInfo.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(moreScreenInfo[index]["name"]),
                            titleTextStyle: TextStyle(
                                fontSize: dimensionFontSize(20),
                                color: AppColors.blackColor),
                            trailing: IconButton(
                                onPressed: () {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    Navigator.of(context).pushNamed(
                                        moreScreenInfo[index]["route"],
                                        arguments: "All");
                                  });
                                },
                                icon: Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  size: dimensionWidth(0.05),
                                )));
                      },
                    ),
                  ),
                ],
              ),
            ),
            ChangeNotifierProvider(
                create: (_) => BottomBarProvider(),
                child: Consumer<BottomBarProvider>(
                    builder: (context, bottomBarProvider, _) {
                  return Builder(builder: (context) {
                    bottomBarProvider.Index = 3;
                    return myBottombar(bottomBarProvider, context);
                  });
                }))
          ],
        ));
  }
}
