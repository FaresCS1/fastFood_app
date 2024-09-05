import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/features/cart/provider/cart_provider.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/dimensions/myDimensions.dart';
import '../../../core/shered_widget/bottomBar/provider/bottomBar_provider.dart';
import '../../../core/shered_widget/bottomBar/widget/bottomBar.dart';
import '../../../core/shered_widget/bottomBar/widget/float_cartIcon.dart';
import '../../../core/shered_widget/global/empty_widget.dart';
import '../widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FirebaseAuth.instance.currentUser != null
            ? const FloatCartIcon()
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
                    ? emptyWidget("No Order Found", Icons.delivery_dining)
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
                          return OrderWidget(
                              numOfItem: numOfItem,
                              totalPrice: totalPrice,
                              order: order);
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
