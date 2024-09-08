import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/appDimension.dart';
import 'package:untitled2/core/routes/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/sheared_widget/Icon_button/widgets/backIcon.dart';
import 'package:untitled2/core/sheared_widget/buttons/fill_buttons/widget/fill_button_navigate_widget.dart';
import 'package:untitled2/core/sheared_widget/dialog/build_dialog.dart';
import 'package:untitled2/features/cart/cart_items.dart';
import '../../../core/shared_preferences/SharedPrefHelper.dart';
import '../../cart/provider/cart_provider.dart';
import '../widgets/foodInfo/meal_action.dart';
import '../widgets/foodInfo/meal_description.dart';

class FoodInfoScreen extends StatelessWidget {
  final Map<dynamic, dynamic> foodInfo;

  const FoodInfoScreen({super.key, required this.foodInfo});

  @override
  Widget build(BuildContext context) {
    BuildDialog.init(context);
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        leading: backIcon(),
        backgroundColor: AppColors.whiteColor,
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.whiteColor,
            width: AppDimension.currentWidth,
            child: Image.asset(
              foodInfo["img"],
              alignment: AlignmentDirectional.topCenter,
              width: dimensionWidth(0.70),
              height: dimensionHeight(0.25),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(150),
                    topLeft: Radius.circular(150)),
              ),
              child: ChangeNotifierProvider(
                create: (_) => CartProvider(),
                child: Builder(builder: (context) {
                  final cartProvider = Provider.of<CartProvider>(context);
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          mealDescription(foodInfo),
                          const SizedBox(height: 20),
                          MealActionWidget(
                              cartProvider: cartProvider, foodInfo: foodInfo),
                          myCart.contains(foodInfo)
                              ? const Text(
                                  "Already added to cart",
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      fontSize: 14, color: AppColors.grayColor),
                                )
                              : Container(),
                        ],
                      ),
                      if (myCart.isNotEmpty &&
                          SharedPrefsHelper.getBool("login")!)
                        fillButtonNavigate("Go To Cart", cartRoute)
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
