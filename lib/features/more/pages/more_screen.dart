import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/shered_widget/bottomBar/provider/bottomBar_provider.dart';
import 'package:untitled2/core/shered_widget/logo/logo.dart';

import '../../../core/routes/myRoutes.dart';
import '../../../core/shered_widget/bottomBar/widget/bottomBar.dart';

class MoreScreen extends StatelessWidget {
  final List _moreScreenInfo = [
    {"name": "Menu", "route": menuRoute},
    {"name": "My Profile", "route": profileRoute},
    {"name": "Terms and Conditions", "route": termsConditionsRoute},
    {"name": "Contact Us", "route": contactRoute},
  ];
  MoreScreen({super.key});

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
                  decoration: const BoxDecoration(
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
                      itemCount: _moreScreenInfo.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(_moreScreenInfo[index]["name"]),
                            titleTextStyle: TextStyle(
                                fontSize: dimensionFontSize(20),
                                color: AppColors.blackColor),
                            trailing: IconButton(
                                onPressed: () {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    Navigator.of(context).pushNamed(
                                        _moreScreenInfo[index]["route"],
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
                    return myBottomBar(bottomBarProvider, context);
                  });
                }))
          ],
        ));
  }
}
