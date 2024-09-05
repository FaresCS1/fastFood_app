import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/appDimension.dart';
import 'package:untitled2/core/routes/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/shered_widget/Icon_button/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/buttons/fill_buttons/widget/fill_button_navigate_widget.dart';

import '../../../core/shared_preferences/SharedPrefHelper.dart';
import '../../cart/provider/cart_provider.dart';
import '../widgets/foodInfo/meal_action.dart';
import '../widgets/foodInfo/meal_description.dart';

class FoodInfoScreen extends StatelessWidget {
  final Map<dynamic, dynamic> foodInfo;

  const FoodInfoScreen({super.key, required this.foodInfo});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
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
                              mealDescription(foodInfo),
                              const SizedBox(height: 20),
                              MealActionWidget(
                                  cartProvider: cartProvider,
                                  foodInfo: foodInfo),
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
