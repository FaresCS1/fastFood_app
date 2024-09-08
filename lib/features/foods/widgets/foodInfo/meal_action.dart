import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/cart/provider/cart_provider.dart';
import '../../../../core/colors/appColors.dart';
import '../../../../core/dimensions/myDimensions.dart';
import '../../../../core/routes/myRoutes.dart';
import '../../../../core/shared_preferences/SharedPrefHelper.dart';
import '../../../../core/sheared_widget/dialog/build_dialog.dart';
import 'package:untitled2/features/cart/cart_items.dart';

class MealActionWidget extends StatelessWidget {
  final CartProvider cartProvider;
  final Map<dynamic, dynamic> foodInfo;
  const MealActionWidget(
      {super.key, required this.cartProvider, required this.foodInfo});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartProvider(),
      child: Builder(builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      cartProvider.moreItem(foodInfo);
                    },
                    icon: Icon(
                      color: AppColors.lightRedColor,
                      Icons.add_circle_outlined,
                      size: dimensionWidth(0.08),
                    )),
                Text(
                  foodInfo["numOfItem"].toString(),
                  style: TextStyle(
                      color: AppColors.midOrangeColor,
                      fontSize: dimensionFontSize(16)),
                ),
                foodInfo["numOfItem"] == 1
                    ? const SizedBox(width: 10)
                    : IconButton(
                        onPressed: () {
                          cartProvider.lessItem(foodInfo);
                        },
                        icon: Icon(
                          color: AppColors.lightRedColor,
                          Icons.do_not_disturb_on,
                          size: dimensionWidth(0.08),
                        ))
              ],
            ),
            Text(
              "Total: ${foodInfo["total price"]} Riyals",
              style: TextStyle(
                  color: AppColors.blackColor, fontSize: dimensionFontSize(18)),
            ),
            Container(
              height: dimensionHeight(0.08),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: myCart.contains(foodInfo)
                      ? AppColors.beigeColor
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                  onTap: () {
                    SharedPrefsHelper.getBool("login")!
                        ? myCart.contains(foodInfo)
                            ? null
                            : cartProvider.addToCart(foodInfo)
                        : BuildDialog.showErrorDialog(
                            icon: Icons.delete_sweep_outlined,
                            title: "filed add to cart",
                            textButton: "Login now",
                            color: AppColors.lightOrangeColor,
                            barrierDismissible: true,
                            content: "you cant add to cart while you gust",
                            route: loginRoute);
                  },
                  child: const Icon(
                    Icons.add_shopping_cart,
                    color: AppColors.orangeColor,
                  )),
            ),
          ],
        );
      }),
    );
  }
}
