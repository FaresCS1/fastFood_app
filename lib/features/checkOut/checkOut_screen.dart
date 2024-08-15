import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/models/app_info.dart';
import 'package:untitled2/core/provider/cart_provider.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/buttons/fill_buttons/fill_button.dart';
import 'package:untitled2/features/cart/pages/cartScreen.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text("CheekOut"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
            color: AppColors.orangeColor,
            fontSize: 28,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        leading: coustmizeIconButton(Icons.arrow_back_ios, const CartScreen()),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Delivery Details",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: currentHeight / 50,
                ),
                Container(
                  height: currentHeight / 3.5,
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
                          height: currentHeight / 6,
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
                          height: currentHeight / 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${curentUser?.address["city"]} - ${curentUser?.address["street"]}",
                                style: const TextStyle(
                                    color: AppColors.midOrangeColor,
                                    fontSize: 18),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: AppColors.grayColor,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: const Text(
                                      "change",
                                      style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 16),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: currentHeight / 50,
                ),
                const Text(
                  "Payment Details",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: currentHeight / 50,
                ),
                Container(
                  height: currentHeight / 6,
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
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: currentHeight / 16,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 5,
                        color: AppColors.whiteColor,
                      ),
                      InkWell(
                        onTap: () {
                          cartProvider.paymentWay();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Container(
                            height: currentHeight / 16,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
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
                                          fontSize: 18),
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
                                      child: const Text(
                                        "change",
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontSize: 16),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: currentHeight / 50,
                ),
                const Text(
                  "Order Summary",
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: currentHeight / 50,
                ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: currentHeight / 25,
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
                                    fontSize: 18),
                              ),
                              Text(
                                "${cartProvider.TotalBill()} \u0024".toString(),
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
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Delivery fees :",
                                style: TextStyle(
                                    color: AppColors.midOrangeColor,
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
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total :",
                                style: TextStyle(
                                    color: AppColors.midOrangeColor,
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
                SizedBox(
                  height: currentHeight / 50,
                ),
                FillButton(
                    text: "Send Order ${cartProvider.totalBill}",
                    icon: Icons.monetization_on,
                    route: HomeScreen())
              ],
            ),
          )),
    );
  }
}
