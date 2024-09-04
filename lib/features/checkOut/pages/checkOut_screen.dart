import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

import 'package:untitled2/features/cart/provider/cart_provider.dart';

import '../../../core/provider/app_state/appState_provider.dart';
import '../../../core/shared_preferences/SharedPrefHelper.dart';
import '../../../core/shered_widget/Icon_button/widgets/backIcon.dart';
import '../../../core/shered_widget/buttons/auth_button/widget/auth_button_widget.dart';

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: dimensionHeight(0.18),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    "assets/images/others/fake_map.jpg"))),
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
                        child: Text(
                          "Saudi - ${SharedPrefsHelper.getString("location")!}",
                          style: const TextStyle(
                              color: AppColors.greenColor, fontSize: 18),
                        ),
                      ),
                    ],
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
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        color: AppColors.grayColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
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
                                "${cartProvider.totalPill} \u0024".toString(),
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
                                "${cartProvider.totalPill + 12} \u0024"
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
                authButtonWidget(
                  "Send Order ${cartProvider.totalPill + 12}",
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
