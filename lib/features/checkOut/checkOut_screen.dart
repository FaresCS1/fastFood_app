import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

import 'package:untitled2/core/provider/cart_provider.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';

import '../../core/provider/appState_provider.dart';
import '../../core/shered_widget/buttons/border_boutton/widget/auth_button_.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text("CheekOut"),
        centerTitle: true,
        titleTextStyle: TextStyle(
            color: AppColors.orangeColor,
            fontSize: dimensionFontSize(28),
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        leading: backIcon(),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Delivery Details",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: dimensionFontSize(22),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: dimensionHeight(0.02)),
                Container(
                  height: dimensionHeight(0.25),
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
                          height: dimensionHeight(0.14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Center(
                            child: Text("IMAGE LOCATION"),
                          ),
                        ),
                        const Divider(
                          height: 5,
                          color: AppColors.whiteColor,
                        ),
                        Container(
                          height: dimensionHeight(0.05),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              // Text(
                              //   "${curentUser?.address["city"]} - ${curentUser?.address["street"]}",
                              //   style: const TextStyle(
                              //       color: AppColors.midOrangeColor,
                              //       fontSize: 18),
                              // ),
                              TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: AppColors.grayColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      "change",
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: dimensionFontSize(16)),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: dimensionHeight(0.02)),
                Text(
                  "Payment Details",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: dimensionFontSize(22),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: dimensionHeight(0.02)),
                Container(
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
                              borderRadius: BorderRadius.only(
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
                              borderRadius: BorderRadius.only(
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
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: AppColors.grayColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      "change",
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: dimensionFontSize(14)),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: dimensionHeight(0.02)),
                Text(
                  "Order Summary",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: dimensionFontSize(22),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: dimensionHeight(0.02),
                ),
                Container(
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
                                "Order Total :",
                                style: TextStyle(
                                    color: AppColors.midOrangeColor,
                                    fontSize: dimensionFontSize(18)),
                              ),
                              Text(
                                "${cartProvider.getTotalBill()} \u0024"
                                    .toString(),
                                style:
                                    TextStyle(fontSize: dimensionFontSize(16)),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 5,
                          color: AppColors.whiteColor,
                        ),
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
                                    fontSize: dimensionFontSize(18)),
                              ),
                              Text(
                                "12 \u0024",
                                style:
                                    TextStyle(fontSize: dimensionFontSize(18)),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          height: 5,
                          color: AppColors.whiteColor,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total :",
                                style: TextStyle(
                                    color: AppColors.midOrangeColor,
                                    fontSize: dimensionFontSize(18)),
                              ),
                              Text(
                                "${cartProvider.getTotalBill() + 12} \u0024"
                                    .toString(),
                                style:
                                    TextStyle(fontSize: dimensionFontSize(16)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                authButton(
                  "Send Order ${cartProvider.totalBill}",
                  Icons.fastfood,
                  () => cartProvider.sendOrder(context),
                ),
                Consumer<AppStateProvider>(
                  builder: (context, appState, child) {
                    if (appState.isConnected == false) {
                      Future.delayed(Duration.zero, () {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Center(
                              child: Text(
                            " No Internet Connection",
                            style: TextStyle(color: AppColors.whiteColor),
                          )),
                          duration: Duration(seconds: 5),
                          backgroundColor: AppColors.redColor,
                        ));
                      });
                      return Container();
                    }
                    return Container();
                  },
                ),
              ],
            ),
          )),
    );
  }
}
