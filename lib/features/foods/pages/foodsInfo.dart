import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/buttons/fill_buttons/fill_button.dart';
import 'package:untitled2/features/foods/pages/foods.dart';

import '../../../core/provider/cart_provider.dart';
import '../../cart/pages/cartScreen.dart';

class Foodsinfo extends StatelessWidget {
  final Map<dynamic, dynamic> foodInfo;

  const Foodsinfo({super.key, required this.foodInfo});

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context);
    cartProvider.ResetBill();
    return Scaffold(
      body: Container(
        color: AppColors.bgColor,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: currentWidth,
              height: currentHeight,
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
              ),
              child: Column(
                children: [
                  AppBar(
                    leading: coustmizeIconButton(
                        Icons.arrow_back_ios, FoodsScreen(type: "All")),
                    backgroundColor: AppColors.whiteColor,
                    actions: [
                      IconButton(
                          onPressed: () {
                            cartProvider.addToCart(foodInfo);
                          },
                          icon: const Icon(
                            Icons.add_shopping_cart,
                            color: AppColors.orangeColor,
                          ))
                    ],
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ),
                    child: Image.asset(
                      foodInfo["img"],
                      height: currentHeight / 4,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: currentHeight / 1.55,
              decoration: const BoxDecoration(
                color: AppColors.bgColor,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    topLeft: Radius.circular(100)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              foodInfo["name"],
                              style: const TextStyle(
                                  color: AppColors.orangeColor, fontSize: 28),
                            ),
                            Text(
                              foodInfo["type"],
                              style: const TextStyle(
                                  color: AppColors.grayColor, fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: currentHeight / 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Row(
                              children: [
                                Text(
                                  "Time",
                                  style: TextStyle(
                                      color: AppColors.brownColor,
                                      fontSize: 16),
                                ),
                                Icon(Icons.access_time_outlined,
                                    color: AppColors.brownColor)
                              ],
                            ),
                            SizedBox(
                              height: currentHeight / 100,
                            ),
                            const Text(
                              "5 min",
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Row(
                              children: [
                                Text("Price",
                                    style: TextStyle(
                                        color: AppColors.brownColor,
                                        fontSize: 18)),
                                Icon(Icons.monetization_on,
                                    color: AppColors.brownColor)
                              ],
                            ),
                            SizedBox(
                              height: currentHeight / 100,
                            ),
                            Text(
                              "${foodInfo["price"].toString()}  Riyals",
                              style: const TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            const Row(
                              children: [
                                Text("Rate",
                                    style: TextStyle(
                                        color: AppColors.brownColor,
                                        fontSize: 16)),
                                Icon(
                                  Icons.star,
                                  color: AppColors.yellowColor,
                                )
                              ],
                            ),
                            SizedBox(
                              height: currentHeight / 100,
                            ),
                            Text(
                              foodInfo["rate"].toString(),
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        height: currentHeight / 16,
                        decoration: BoxDecoration(
                            color: AppColors.beigeColor,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      cartProvider.moreItem(foodInfo);
                                    },
                                    icon: Icon(
                                      color: AppColors.brownColor,
                                      Icons.add_circle_outlined,
                                      size: currentWidth / 14,
                                    )),
                                const SizedBox(width: 10),
                                Text(
                                  foodInfo["numOfItem"].toString(),
                                  style: const TextStyle(
                                      color: AppColors.brownColor,
                                      fontSize: 25),
                                ),
                                const SizedBox(width: 10),
                                IconButton(
                                    onPressed: () {
                                      cartProvider.lessItem(foodInfo);
                                    },
                                    icon: Icon(
                                      color: AppColors.brownColor,
                                      Icons.do_not_disturb_on,
                                      size: currentWidth / 14,
                                    ))
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColors.lightOrangeColor,
                                  borderRadius: BorderRadius.circular(15)),
                              width: currentWidth / 2,
                              height: currentHeight / 16,
                              child: Center(
                                child: Text(
                                  "Total Price ${foodInfo["total price"]} Riyals"
                                  "",
                                  style: const TextStyle(
                                      color: AppColors.brownColor,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: currentHeight / 10),
                    if (cartProvider.MyCart.isNotEmpty)
                      FillButton(
                          text: "Make Order",
                          icon: Icons.arrow_circle_right_outlined,
                          route: CartScreen())
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
