import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/constants/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';

import '../../../core/provider/cart_provider.dart';
import '../../../core/shered_widget/buttons/fill_buttons/widget/fill_button_navgite.dart';
import '../../../core/shered_widget/dialog/customized_dialog.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.myCart;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          actions: [
            cartItems.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.delete_sweep_outlined,
                      color: AppColors.lightRedColor,
                      size: dimensionWidth(0.10),
                    ),
                    onPressed: () => showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return ConfirmDialog(
                              content:
                                  "are you sure to delete all tour items card",
                              fun: cartProvider.emptyCart,
                              title: "Empty Cart",
                              textButton: "Empty",
                              route: homeRoute,
                              icon: Icons.delete_sweep_outlined,
                              color: AppColors.orangeColor);
                        }),
                  )
                : Container()
          ],
          title: const Text("Cart"),
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: AppColors.orangeColor,
              fontSize: dimensionFontSize(28),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          leading: backIcon()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          cartItems.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.remove_shopping_cart,
                        color: AppColors.orangeColor,
                        size: dimensionWidth(0.20),
                      ),
                      Text(
                        "Empty Shopping Cart",
                        style: TextStyle(
                            color: AppColors.lightOrangeColor,
                            fontSize: dimensionFontSize(25)),
                      )
                    ],
                  ),
                )
              : Container(
                  height: dimensionHeight(0.85),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "My Order",
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: dimensionFontSize(22),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: dimensionHeight(0.03),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) {
                                final item = cartItems[index];
                                return Container(
                                  height: dimensionHeight(0.20),
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            item["img"],
                                            height: dimensionHeight(0.15),
                                            width: dimensionWidth(0.20),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item["name"],
                                                style: TextStyle(
                                                    fontSize:
                                                        dimensionFontSize(16),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        cartProvider.moreItem(
                                                            cartProvider
                                                                .myCart[index]);
                                                        cartProvider
                                                            .getTotalBill();
                                                      },
                                                      icon: Icon(
                                                        color: AppColors
                                                            .brownColor,
                                                        Icons
                                                            .add_circle_outlined,
                                                        size: dimensionWidth(
                                                            0.10),
                                                      )),
                                                  Text(
                                                    item["numOfItem"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: AppColors
                                                            .brownColor,
                                                        fontSize:
                                                            dimensionFontSize(
                                                                18)),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        cartProvider.lessItem(
                                                            cartProvider
                                                                .myCart[index]);
                                                        // cartProvider
                                                        //     .TotalBill();
                                                      },
                                                      icon: Icon(
                                                        color: AppColors
                                                            .brownColor,
                                                        Icons.do_not_disturb_on,
                                                        size: dimensionWidth(
                                                            0.10),
                                                      ))
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                              "${item["total price"].toString()} \u0024",
                                              style: TextStyle(
                                                  fontSize:
                                                      dimensionFontSize(18),
                                                  fontWeight: FontWeight.bold)),
                                          IconButton(
                                              onPressed: () {
                                                cartProvider.removeFromCart(
                                                    cartProvider.myCart[index]);
                                                // cartProvider.TotalBill();
                                              },
                                              icon: Icon(
                                                Icons.delete_outline_outlined,
                                                color: AppColors.redColor,
                                                size: dimensionWidth(0.10),
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Order Summary",
                              style: TextStyle(
                                color: AppColors.blackColor,
                                fontSize: dimensionFontSize(22),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: dimensionHeight(0.03),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Order Total :",
                                            style: TextStyle(
                                                color: AppColors.midOrangeColor,
                                                fontSize:
                                                    dimensionFontSize(18)),
                                          ),
                                          Text(
                                            "${cartProvider.getTotalBill()} \u0024"
                                                .toString(),
                                            style: TextStyle(
                                                fontSize:
                                                    dimensionFontSize(16)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Delivery fees :",
                                            style: TextStyle(
                                                color: AppColors.midOrangeColor,
                                                fontSize:
                                                    dimensionFontSize(18)),
                                          ),
                                          Text(
                                            "12 \u0024",
                                            style: TextStyle(
                                                fontSize:
                                                    dimensionFontSize(18)),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total :",
                                            style: TextStyle(
                                                color: AppColors.midOrangeColor,
                                                fontSize:
                                                    dimensionFontSize(18)),
                                          ),
                                          Text(
                                            "${cartProvider.getTotalBill() + 12} \u0024"
                                                .toString(),
                                            style: TextStyle(
                                                fontSize:
                                                    dimensionFontSize(16)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: dimensionHeight(0.06)),
                            cartItems.isNotEmpty
                                ? fillButtonNavigate(
                                    "Go to checkout", checkOutRoute)
                                : Container()
                          ],
                        )
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
