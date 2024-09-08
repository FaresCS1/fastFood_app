import 'package:flutter/cupertino.dart';

import '../../colors/appColors.dart';
import '../../dimensions/myDimensions.dart';

class OrderSummaryWidget extends StatelessWidget {
  final List<dynamic> orderInfo;
  final bool orderInProgress;
  final bool withNumberOfItems;
  final int cartTotalPrice;
  final bool withDeliveryFees;
  const OrderSummaryWidget(
      {super.key,
      required this.orderInfo,
      required this.withNumberOfItems,
      required this.withDeliveryFees,
      required this.cartTotalPrice,
      required this.orderInProgress});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimensionHeight(0.15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.whiteColor,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                withNumberOfItems
                    ? "Number Of Food Items :"
                    : "Delivery fees :",
                style: TextStyle(
                    color: AppColors.midOrangeColor,
                    fontSize: dimensionFontSize(16)),
              ),
              Text(
                withNumberOfItems ? "${orderInfo.length} item" : "12 riyals",
                style: TextStyle(
                    fontSize: dimensionFontSize(14),
                    color: AppColors.blackColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order Total :",
                style: TextStyle(
                    color: AppColors.midOrangeColor,
                    fontSize: dimensionFontSize(16)),
              ),
              Text(
                orderInProgress
                    ? "$cartTotalPrice riyals".toString()
                    : "${orderInfo.last["totalPrice"]} riyals".toString(),
                style: TextStyle(
                    fontSize: dimensionFontSize(14),
                    color: AppColors.blackColor),
              ),
            ],
          ),
          withDeliveryFees
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Order Total with fees :",
                      style: TextStyle(
                          color: AppColors.midOrangeColor,
                          fontSize: dimensionFontSize(16)),
                    ),
                    Text(
                      "${cartTotalPrice + 12} riyals".toString(),
                      style: TextStyle(
                          fontSize: dimensionFontSize(14),
                          color: AppColors.blackColor),
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
