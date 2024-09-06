import 'package:flutter/material.dart';
import 'package:untitled2/features/cart/provider/cart_provider.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/dimensions/myDimensions.dart';

class CartItemsWidget extends StatelessWidget {
  final CartProvider cartProvider;
  const CartItemsWidget({super.key, required this.cartProvider});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartProvider.myCart.length,
      itemBuilder: (context, index) {
        final item = cartProvider.myCart[index];
        return Container(
          height: dimensionHeight(0.20),
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Image.asset(
                item["img"],
                height: dimensionHeight(0.15),
                width: dimensionWidth(0.20),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    item["name"],
                    style: TextStyle(
                        color: AppColors.orangeColor,
                        fontWeight: FontWeight.bold,
                        fontSize: dimensionFontSize(18)),
                  ),
                  SizedBox(
                    width: dimensionWidth(0.65),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  WidgetsBinding.instance
                                      .addPostFrameCallback((_) {
                                    cartProvider
                                        .moreItem(cartProvider.myCart[index]);
                                  });
                                },
                                icon: Icon(
                                  color: AppColors.lightRedColor,
                                  Icons.add_circle_outlined,
                                  size: dimensionWidth(0.07),
                                )),
                            Text(
                              item["numOfItem"].toString(),
                              style: TextStyle(
                                  color: AppColors.brownColor,
                                  fontSize: dimensionFontSize(16)),
                            ),
                            item["numOfItem"] == 1
                                ? const SizedBox(width: 10)
                                : IconButton(
                                    onPressed: () {
                                      WidgetsBinding.instance
                                          .addPostFrameCallback((_) {
                                        cartProvider.lessItem(
                                            cartProvider.myCart[index]);
                                        // cartProvider
                                        //     .TotalBill();
                                      });
                                    },
                                    icon: Icon(
                                      color: AppColors.lightRedColor,
                                      Icons.do_not_disturb_on,
                                      size: dimensionWidth(0.07),
                                    )),
                            Text(
                              "${item["total price"].toString()} Riyals",
                              style: TextStyle(
                                  color: AppColors.blackColor,
                                  fontSize: dimensionFontSize(16)),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                cartProvider
                                    .removeFromCart(cartProvider.myCart[index]);
                                // cartProvider.TotalBill();
                              });
                            },
                            icon: Icon(
                              Icons.delete_outline_outlined,
                              color: AppColors.redColor,
                              size: dimensionWidth(0.07),
                            )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
