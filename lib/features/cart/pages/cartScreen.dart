import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/buttons/fill_buttons/fill_button.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';

import '../../../core/models/app_info.dart';
import '../../../core/provider/cart_provider.dart';
import '../../payment/payment_screen.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    cartProvider.TotalBill();
    return Material(
      color: AppColors.bgColor,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                children: [
                  AppBar(
                    backgroundColor: AppColors.bgColor,
                    leading: coustmizeIconButton(
                        Icons.arrow_back_ios, const HomeScreen()),
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Center(
                      child: curentUser?.address["city"] == null
                          ? const Text(
                              "you Cant order Without Login",
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.redColor),
                            )
                          : Text(
                              "Delivery to ${curentUser?.address["city"]} - street ${curentUser?.address["street"]}",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: AppColors.lightOrangeColor),
                            ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 700,
                      child: cartProvider.MyCart.isNotEmpty
                          ? ListView.builder(
                              itemCount: cartProvider.MyCart.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  height: 150,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  padding: const EdgeInsets.all(10),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                cartProvider.MyCart[index]
                                                    ["name"],
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Image.asset(
                                                cartProvider.MyCart[index]
                                                    ["img"],
                                                height: 100,
                                                width: 100,
                                              ),
                                            ],
                                          ),
                                          Text(
                                              "${cartProvider.MyCart[index]["total price"].toString()} Riyals",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold))
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    cartProvider.moreItem(
                                                        cartProvider
                                                            .MyCart[index]);
                                                    cartProvider.TotalBill();
                                                  },
                                                  icon: const Icon(
                                                    color: AppColors.brownColor,
                                                    Icons.add_circle_outlined,
                                                    size: 23,
                                                  )),
                                              Text(
                                                cartProvider.MyCart[index]
                                                        ["numOfItem"]
                                                    .toString(),
                                                style: const TextStyle(
                                                    color: AppColors.brownColor,
                                                    fontSize: 18),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    cartProvider.lessItem(
                                                        cartProvider
                                                            .MyCart[index]);
                                                    cartProvider.TotalBill();
                                                  },
                                                  icon: const Icon(
                                                    color: AppColors.brownColor,
                                                    Icons.do_not_disturb_on,
                                                    size: 23,
                                                  ))
                                            ],
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                cartProvider.removeFromCart(
                                                    cartProvider.MyCart[index]);
                                                cartProvider.TotalBill();
                                              },
                                              icon: const Icon(
                                                Icons.delete_outline_outlined,
                                                color: AppColors.redColor,
                                                size: 30,
                                              ))
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              })
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.remove_shopping_cart,
                                  color: AppColors.orangeColor,
                                  size: 70,
                                ),
                                Text(
                                  "Empty Shopping Cart",
                                  style: TextStyle(
                                      color: AppColors.lightOrangeColor,
                                      fontSize: 30),
                                )
                              ],
                            )),
                ],
              ),
              cartProvider.MyCart.isNotEmpty
                  ? FillButton(
                      text: "Payment Total ${cartProvider.totalBill}",
                      icon: Icons.monetization_on,
                      route: const PaymentScreen())
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
