import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';

import 'package:untitled2/features/cart/provider/cart_provider.dart';

import '../../../core/provider/app_state/appState_provider.dart';
import '../../../core/shered_widget/Icon_button/widgets/backIcon.dart';
import '../../../core/shered_widget/buttons/auth_button/widget/auth_button_widget.dart';
import '../../../core/shered_widget/global/order_summary_widget.dart';
import '../../../core/shered_widget/global/sub_title.dart';
import '../widget/location_widget.dart';
import '../widget/payment_way.dart';

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
                subTitle("Delivery Details"),
                SizedBox(height: dimensionHeight(0.02)),
                locationWidget(),
                SizedBox(height: dimensionHeight(0.02)),
                subTitle("Payment Details"),
                SizedBox(height: dimensionHeight(0.02)),
                PaymentWayWidget(cartProvider: cartProvider),
                SizedBox(height: dimensionHeight(0.02)),
                subTitle("Order Summary"),
                SizedBox(
                  height: dimensionHeight(0.02),
                ),
                OrderSummaryWidget(
                  orderInfo: cartProvider.myCart,
                  withNumberOfItems: false,
                  orderInProgress: true,
                  withDeliveryFees: true,
                  cartTotalPrice: cartProvider.totalPill,
                ),
                authButtonWidget(
                  "Send Order ${cartProvider.totalPill + 12}",
                  Icons.fastfood,
                  () => cartProvider.sendOrder(),
                ),
                Consumer<AppStateProvider>(
                  builder: (context, appState, child) {
                    if (appState.isConnected == false) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
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
