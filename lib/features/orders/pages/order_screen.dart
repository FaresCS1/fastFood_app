import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/shered_widget/logo/logo.dart';
import 'package:untitled2/features/cart/provider/cart_provider.dart';
import 'package:untitled2/features/orders/data/myOrders.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/dimensions/myDimensions.dart';
import '../../../core/routes/myRoutes.dart';
import '../../../core/shared_preferences/SharedPrefHelper.dart';
import '../../../core/shered_widget/bottomBar/provider/bottomBar_provider.dart';
import '../../../core/shered_widget/bottomBar/widget/bottomBar.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FirebaseAuth.instance.currentUser != null
            ? InkWell(
                onTap: () {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.of(context).pushNamed(cartRoute);
                  });
                },
                child: Container(
                  height: dimensionHeight(0.15),
                  width: dimensionWidth(0.15),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.orangeColor,
                  ),
                  child: Icon(
                    Icons.add_shopping_cart,
                    color: AppColors.whiteColor,
                    size: dimensionWidth(0.10),
                  ),
                ),
              )
            : null,
        backgroundColor: AppColors.bgColor,
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          leading: Container(),
          title: const Text("My Orders"),
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: AppColors.orangeColor,
              fontSize: dimensionFontSize(28),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: dimensionHeight(0.75),
                padding: const EdgeInsets.all(20),
                alignment: cartProvider.myOrder.isEmpty
                    ? AlignmentDirectional.center
                    : Alignment.topCenter,
                child: cartProvider.myOrder.isEmpty
                    ? const Text(
                        "No Order Found",
                        style: TextStyle(color: AppColors.midOrangeColor),
                      )
                    : ListView.builder(
                        itemCount: cartProvider.myOrder.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          int numOfItem =
                              cartProvider.myOrder[index].length - 1;
                          int totalPrice =
                              cartProvider.myOrder[index].last["totalPrice"];
                          final List<dynamic> order =
                              cartProvider.myOrder[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(orderDetailsRoute,
                                  arguments: order);
                            },
                            child: Container(
                              height: dimensionHeight(0.20),
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: dimensionWidth(0.40),
                                    child: Stack(
                                      alignment: AlignmentDirectional.topEnd,
                                      children: [
                                        Container(
                                          width: dimensionWidth(0.40),
                                          height: dimensionHeight(0.75),
                                          decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "assets/images/others/orders.png"))),
                                        ),
                                        appLogo(dimensionWidth(0.10),
                                            dimensionWidth(0.10)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: dimensionWidth(0.40),
                                    height: dimensionWidth(0.85),
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Total Price",
                                              style: TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize:
                                                      dimensionFontSize(14)),
                                            ),
                                            Text(
                                              "$totalPrice",
                                              style: TextStyle(
                                                  color: AppColors.orangeColor,
                                                  fontSize:
                                                      dimensionFontSize(14)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Address",
                                              style: TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize:
                                                      dimensionFontSize(14)),
                                            ),
                                            Text(
                                              SharedPrefsHelper.getString(
                                                  "location")!,
                                              style: TextStyle(
                                                  color: AppColors.orangeColor,
                                                  fontSize:
                                                      dimensionFontSize(14)),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Number of items",
                                              style: TextStyle(
                                                  color: AppColors.blackColor,
                                                  fontSize:
                                                      dimensionFontSize(14)),
                                            ),
                                            Text(
                                              "$numOfItem",
                                              style: TextStyle(
                                                  color: AppColors.orangeColor,
                                                  fontSize:
                                                      dimensionFontSize(14)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        })),
            ChangeNotifierProvider(
                create: (_) => BottomBarProvider(),
                child: Consumer<BottomBarProvider>(
                    builder: (context, bottomBarProvider, _) {
                  return Builder(builder: (context) {
                    bottomBarProvider.Index = 1;
                    return myBottomBar(bottomBarProvider, context);
                  });
                }))
          ],
        ));
  }
}
