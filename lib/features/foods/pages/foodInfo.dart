import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/constants/appDimension.dart';
import 'package:untitled2/core/constants/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/provider/user_provider.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/buttons/fill_buttons/widget/fill_button_navgite.dart';

import '../../../core/classes/shared_preferences/SharedPrefHelper.dart';
import '../../../core/provider/cart_provider.dart';
import '../../../core/shered_widget/dialog/customized_dialog.dart';

class FoodInfo extends StatelessWidget {
  final Map<dynamic, dynamic> foodInfo;

  const FoodInfo({super.key, required this.foodInfo});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: backIcon(),
        backgroundColor: AppColors.whiteColor,
      ),
      body: Container(
          color: AppColors.bgColor,
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: AppDimension.currentWidth,
                    height: AppDimension.currentHeight,
                    decoration: const BoxDecoration(
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Container(
                    height: dimensionHeight(0.60),
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: AppColors.bgColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          topLeft: Radius.circular(100)),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        foodInfo["name"],
                                        style: TextStyle(
                                            color: AppColors.orangeColor,
                                            fontSize: dimensionFontSize(24)),
                                      ),
                                      Text(
                                        foodInfo["type"],
                                        style: TextStyle(
                                            color: AppColors.grayColor,
                                            fontSize: dimensionFontSize(20)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: dimensionHeight(0.04),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Time",
                                            style: TextStyle(
                                                color: AppColors.brownColor,
                                                fontSize:
                                                    dimensionFontSize(18)),
                                          ),
                                          Icon(Icons.access_time_outlined,
                                              color: AppColors.brownColor)
                                        ],
                                      ),
                                      SizedBox(
                                        height: dimensionHeight(0.02),
                                      ),
                                      Text(
                                        "5 min",
                                        style: TextStyle(
                                            fontSize: dimensionFontSize(18)),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Price",
                                              style: TextStyle(
                                                  color: AppColors.brownColor,
                                                  fontSize:
                                                      dimensionFontSize(18))),
                                          Icon(Icons.monetization_on,
                                              color: AppColors.brownColor)
                                        ],
                                      ),
                                      SizedBox(
                                        height: dimensionHeight(0.02),
                                      ),
                                      Text(
                                        "${foodInfo["price"].toString()}  Riyals",
                                        style: TextStyle(
                                            fontSize: dimensionFontSize(18)),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text("Rate",
                                              style: TextStyle(
                                                  color: AppColors.brownColor,
                                                  fontSize:
                                                      dimensionFontSize(18))),
                                          Icon(
                                            Icons.star,
                                            color: AppColors.yellowColor,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: dimensionHeight(0.02),
                                      ),
                                      Text(
                                        foodInfo["rate"].toString(),
                                        style: TextStyle(
                                            fontSize: dimensionFontSize(18)),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: dimensionHeight(0.04),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                                onPressed: () {
                                                  cartProvider
                                                      .moreItem(foodInfo);
                                                },
                                                icon: Icon(
                                                  color: AppColors.brownColor,
                                                  Icons.add_circle_outlined,
                                                  size: dimensionWidth(0.08),
                                                )),
                                            Text(
                                              foodInfo["numOfItem"].toString(),
                                              style: TextStyle(
                                                  color: AppColors.brownColor,
                                                  fontSize:
                                                      dimensionFontSize(18)),
                                            ),
                                            IconButton(
                                                onPressed: () {
                                                  cartProvider
                                                      .lessItem(foodInfo);
                                                },
                                                icon: Icon(
                                                  color: AppColors.brownColor,
                                                  Icons.do_not_disturb_on,
                                                  size: dimensionWidth(0.08),
                                                ))
                                          ],
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                          "Total: ${foodInfo["total price"]} Riyals",
                                          style: TextStyle(
                                              color: AppColors.brownColor,
                                              fontSize: dimensionFontSize(18)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    height: dimensionHeight(0.08),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: cartProvider.myCart
                                                .contains(foodInfo)
                                            ? AppColors.beigeColor
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: InkWell(
                                        onTap: () {
                                          SharedPrefsHelper.getBool("login")!
                                              ? cartProvider.myCart
                                                      .contains(foodInfo)
                                                  ? null
                                                  : cartProvider
                                                      .addToCart(foodInfo)
                                              : showDialog(
                                                  context: context,
                                                  barrierDismissible: true,
                                                  builder:
                                                      (BuildContext context) {
                                                    return const ErrorDialog(
                                                        content:
                                                            "you cant add to cart while you gust",
                                                        title:
                                                            "filed add to cart",
                                                        textButton:
                                                            "Login Know",
                                                        color: AppColors
                                                            .lightOrangeColor,
                                                        route: loginRoute);
                                                  });
                                        },
                                        child: Icon(
                                          Icons.add_shopping_cart,
                                          color: AppColors.orangeColor,
                                        )),
                                  ),
                                ],
                              ),
                              cartProvider.myCart.contains(foodInfo)
                                  ? const Text(
                                      "Already added to cart",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColors.grayColor),
                                    )
                                  : Container()
                            ],
                          ),
                          if (cartProvider.myCart.isNotEmpty &&
                              SharedPrefsHelper.getBool("login")!)
                            fillButtonNavigate("Go To Cart", cartRoute)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: Image.asset(
                  foodInfo["img"],
                  alignment: AlignmentDirectional.topCenter,
                  width: dimensionWidth(0.70),
                  height: dimensionHeight(0.25),
                ),
              ),
            ],
          )),
    );
  }
}
