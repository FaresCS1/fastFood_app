import 'package:flutter/material.dart';
import 'package:untitled2/features/cart/provider/cart_provider.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/dimensions/myDimensions.dart';

class PaymentWayWidget extends StatelessWidget {
  final CartProvider cartProvider;
  const PaymentWayWidget({super.key, required this.cartProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimensionHeight(0.15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              cartProvider.paymentWay();
            },
            child: Container(
              height: dimensionHeight(0.06),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15)),
                  color: cartProvider.credit
                      ? AppColors.midOrangeColor
                      : Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.attach_money,
                      color: cartProvider.credit
                          ? AppColors.whiteColor
                          : AppColors.blackColor),
                  Text(
                    "Cash",
                    style: TextStyle(
                        color: cartProvider.credit
                            ? AppColors.whiteColor
                            : AppColors.blackColor,
                        fontSize: dimensionFontSize(18)),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 2,
            color: AppColors.whiteColor,
          ),
          InkWell(
            onTap: () {
              cartProvider.paymentWay();
            },
            child: Container(
              height: dimensionHeight(0.06),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  color: cartProvider.credit
                      ? Colors.transparent
                      : AppColors.midOrangeColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.credit_card,
                        color: cartProvider.credit
                            ? AppColors.blackColor
                            : AppColors.whiteColor,
                      ),
                      Text(
                        "Credit Card",
                        style: TextStyle(
                            color: cartProvider.credit
                                ? AppColors.blackColor
                                : AppColors.whiteColor,
                            fontSize: dimensionFontSize(18)),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: AppColors.grayColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "change",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: dimensionFontSize(12)),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
