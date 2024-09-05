import 'package:flutter/material.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/dimensions/myDimensions.dart';
import '../../../core/routes/myRoutes.dart';
import '../../../core/shared_preferences/SharedPrefHelper.dart';
import '../../../core/shered_widget/logo/logo.dart';

class OrderWidget extends StatelessWidget {
  final int numOfItem;
  final int totalPrice;
  final List<dynamic> order;
  const OrderWidget(
      {super.key,
      required this.numOfItem,
      required this.totalPrice,
      required this.order});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(orderDetailsRoute, arguments: order);
      },
      child: Container(
        height: dimensionHeight(0.20),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: dimensionWidth(0.40),
              child: Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Container(
                    width: dimensionWidth(0.40),
                    height: dimensionHeight(0.75),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                AssetImage("assets/images/others/orders.png"))),
                  ),
                  appLogo(dimensionWidth(0.10), dimensionWidth(0.10)),
                ],
              ),
            ),
            Container(
              width: dimensionWidth(0.40),
              height: dimensionWidth(0.85),
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: dimensionFontSize(14)),
                      ),
                      Text(
                        "$totalPrice",
                        style: TextStyle(
                            color: AppColors.orangeColor,
                            fontSize: dimensionFontSize(14)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Address",
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: dimensionFontSize(14)),
                      ),
                      Text(
                        SharedPrefsHelper.getString("location")!,
                        style: TextStyle(
                            color: AppColors.orangeColor,
                            fontSize: dimensionFontSize(14)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Number of items",
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: dimensionFontSize(14)),
                      ),
                      Text(
                        "$numOfItem",
                        style: TextStyle(
                            color: AppColors.orangeColor,
                            fontSize: dimensionFontSize(14)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
