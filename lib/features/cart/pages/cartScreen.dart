import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/buttons/fill_buttons/fill_button.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';

import '../../../core/provider/cart_provider.dart';
import '../../checkOut/checkOut_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItems = cartProvider.MyCart;
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AppBar(
                backgroundColor: AppColors.bgColor,
                actions: [
                  cartItems.isNotEmpty
                      ? IconButton(
                          onPressed: () => cartProvider.emptyCart(),
                          icon: Icon(
                            Icons.delete_sweep_outlined,
                            color: AppColors.lightRedColor,
                            size: currentWidth / 13,
                          ))
                      : Container()
                ],
                title: const Text("Cart"),
                centerTitle: true,
                titleTextStyle: const TextStyle(
                    color: AppColors.orangeColor,
                    fontSize: 28,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
                leading: coustmizeIconButton(
                    Icons.arrow_back_ios, const HomeScreen()),
              ),
              cartItems.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove_shopping_cart,
                          color: AppColors.orangeColor,
                          size: currentWidth / 6,
                        ),
                        Text(
                          "Empty Shopping Cart",
                          style: TextStyle(
                              color: AppColors.lightOrangeColor, fontSize: 30),
                        )
                      ],
                    )
                  : ChangeNotifierProvider(
                      create: (context) {},
                      child: Builder(
                        builder: (context) {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  "My Order",
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: cartItems.length,
                                  itemBuilder: (context, index) {
                                    final item = cartItems[index];
                                    return Container(
                                      height: currentHeight / 6.5,
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
                                                height: currentHeight / 8,
                                                width: currentWidth / 4,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    item["name"],
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Row(
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            cartProvider.moreItem(
                                                                cartProvider
                                                                        .MyCart[
                                                                    index]);
                                                            cartProvider
                                                                .TotalBill();
                                                          },
                                                          icon: Icon(
                                                            color: AppColors
                                                                .brownColor,
                                                            Icons
                                                                .add_circle_outlined,
                                                            size: currentWidth /
                                                                14,
                                                          )),
                                                      Text(
                                                        item["numOfItem"]
                                                            .toString(),
                                                        style: const TextStyle(
                                                            color: AppColors
                                                                .brownColor,
                                                            fontSize: 18),
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            cartProvider.lessItem(
                                                                cartProvider
                                                                        .MyCart[
                                                                    index]);
                                                            // cartProvider
                                                            //     .TotalBill();
                                                          },
                                                          icon: Icon(
                                                            color: AppColors
                                                                .brownColor,
                                                            Icons
                                                                .do_not_disturb_on,
                                                            size: currentWidth /
                                                                14,
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
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              IconButton(
                                                  onPressed: () {
                                                    cartProvider.removeFromCart(
                                                        cartProvider
                                                            .MyCart[index]);
                                                    // cartProvider.TotalBill();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .delete_outline_outlined,
                                                    color: AppColors.redColor,
                                                    size: currentWidth / 14,
                                                  ))
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                const Text(
                                  "Order Summary",
                                  style: TextStyle(
                                    color: AppColors.blackColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: currentHeight / 50),
                                Container(
                                  height: currentHeight / 6,
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
                                          height: currentHeight / 25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Order Total :",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .midOrangeColor,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                "${cartProvider.TotalBill()} \u0024"
                                                    .toString(),
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 5,
                                          color: AppColors.whiteColor,
                                        ),
                                        Container(
                                          height: currentHeight / 25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Delivery fees :",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .midOrangeColor,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                "12 \u0024",
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 5,
                                          color: AppColors.whiteColor,
                                        ),
                                        Container(
                                          height: currentHeight / 25,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Total :",
                                                style: TextStyle(
                                                    color: AppColors
                                                        .midOrangeColor,
                                                    fontSize: 18),
                                              ),
                                              Text(
                                                "${cartProvider.TotalBill() + 12} \u0024"
                                                    .toString(),
                                                style: TextStyle(fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: currentHeight / 50),
                                cartItems.isNotEmpty
                                    ? const FillButton(
                                        text: "Go to checkout",
                                        icon: Icons.monetization_on,
                                        route: CheckOutScreen())
                                    : Container()
                              ],
                            ),
                          );
                        },
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
