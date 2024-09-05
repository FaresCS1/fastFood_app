import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/routes/myRoutes.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/shered_widget/global/order_summary_widget.dart';
import 'package:untitled2/features/cart/provider/cart_provider.dart';

import '../../../core/shered_widget/Icon_button/widgets/backIcon.dart';
import '../../../core/shered_widget/buttons/fill_buttons/widget/fill_button_navigate_widget.dart';
import '../../../core/shered_widget/dialog/confirm_dialog/confirm_dialog.dart';
import '../../../core/shered_widget/global/empty_widget.dart';
import '../../../core/shered_widget/global/sub_title.dart';
import '../widgets/cartItemsWidget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          actions: [
            cartProvider.myCart.isNotEmpty
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
          cartProvider.myCart.isEmpty
              ? emptyWidget("Empty Shopping Cart", Icons.shopping_cart_outlined)
              : Container(
                  height: dimensionHeight(0.85),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            subTitle("My Order"),
                            SizedBox(
                              height: dimensionHeight(0.03),
                            ),
                            CartItemsWidget(cartProvider: cartProvider),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            subTitle("Order Summary"),
                            SizedBox(
                              height: dimensionHeight(0.03),
                            ),
                            OrderSummaryWidget(
                                orderInfo: cartProvider.myCart,
                                withNumberOfItems: true,
                                orderInProgress: true,
                                withDeliveryFees: false,
                                cartTotalPrice: cartProvider.totalPill),
                            SizedBox(height: dimensionHeight(0.06)),
                            cartProvider.myCart.isNotEmpty
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
