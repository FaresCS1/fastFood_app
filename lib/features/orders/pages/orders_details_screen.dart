import 'package:flutter/material.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/dimensions/myDimensions.dart';
import '../../../core/sheared_widget/Icon_button/widgets/backIcon.dart';
import '../../../core/sheared_widget/global/order_summary_widget.dart';
import '../widgets/orders_details_widget.dart';

class OrderDetailsScreen extends StatelessWidget {
  final List<dynamic> orderInfo;
  const OrderDetailsScreen({super.key, required this.orderInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          title: const Text("Orders Details"),
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: AppColors.orangeColor,
              fontSize: dimensionFontSize(28),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          leading: backIcon()),
      body: Container(
        height: dimensionHeight(0.85),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: dimensionHeight(0.80),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: dimensionHeight(0.70),
                  color: AppColors.bgColor,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: orderInfo.length - 1,
                    itemBuilder: (context, index) {
                      final item = orderInfo[index];
                      return orderDetailsWidget(item);
                    },
                  ),
                ),
                OrderSummaryWidget(
                  orderInfo: orderInfo,
                  orderInProgress: false,
                  withNumberOfItems: false,
                  withDeliveryFees: true,
                  cartTotalPrice: orderInfo.last["totalPrice"],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
