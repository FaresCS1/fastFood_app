import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/dimensions/myDimensions.dart';
import '../../../core/shered_widget/Icon_button/widgets/backIcon.dart';

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
                      return Container(
                        height: dimensionHeight(0.20),
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              item["img"],
                              height: dimensionHeight(0.15),
                              width: dimensionWidth(0.25),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item["name"],
                                  style: TextStyle(
                                      color: AppColors.orangeColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: dimensionFontSize(18)),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Number of item : ",
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: dimensionFontSize(14)),
                                    ),
                                    Text(
                                      item["numOfItem"].toString(),
                                      style: TextStyle(
                                          color: AppColors.orangeColor,
                                          fontSize: dimensionFontSize(14)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Item Price : ",
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: dimensionFontSize(14)),
                                    ),
                                    Text(
                                      item["price"].toString(),
                                      style: TextStyle(
                                          color: AppColors.orangeColor,
                                          fontSize: dimensionFontSize(14)),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Total Price : ",
                                      style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: dimensionFontSize(14)),
                                    ),
                                    Text(
                                      item["total price"].toString(),
                                      style: TextStyle(
                                          color: AppColors.orangeColor,
                                          fontSize: dimensionFontSize(14)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: dimensionHeight(0.15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: AppColors.whiteColor,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery fees :",
                                style: TextStyle(
                                    color: AppColors.midOrangeColor,
                                    fontSize: dimensionFontSize(16)),
                              ),
                              Text(
                                "12",
                                style:
                                    TextStyle(fontSize: dimensionFontSize(14)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order Total :",
                                style: TextStyle(
                                    color: AppColors.midOrangeColor,
                                    fontSize: dimensionFontSize(16)),
                              ),
                              Text(
                                "${orderInfo.last["totalPrice"]} \u0024"
                                    .toString(),
                                style:
                                    TextStyle(fontSize: dimensionFontSize(14)),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Order Total with fees :",
                                style: TextStyle(
                                    color: AppColors.midOrangeColor,
                                    fontSize: dimensionFontSize(16)),
                              ),
                              Text(
                                "${orderInfo.last["totalPrice"] + 12} \u0024"
                                    .toString(),
                                style:
                                    TextStyle(fontSize: dimensionFontSize(14)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
