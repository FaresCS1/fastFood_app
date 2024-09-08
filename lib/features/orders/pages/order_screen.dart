import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/dimensions/myDimensions.dart';
import '../../../core/sheared_widget/bottomBar/provider/bottomBar_provider.dart';
import '../../../core/sheared_widget/bottomBar/widget/bottomBar.dart';
import '../../../core/sheared_widget/bottomBar/widget/float_cartIcon.dart';
import '../../../core/sheared_widget/global/empty_widget.dart';
import '../list_of_orders.dart';
import '../widgets/order_widget.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                alignment: myOrders.isEmpty
                    ? AlignmentDirectional.center
                    : Alignment.topCenter,
                child: myOrders.isEmpty
                    ? emptyWidget("No Order Found", Icons.delivery_dining)
                    : ListView.builder(
                        itemCount: myOrders.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          int numOfItem = myOrders[index].length - 1;
                          int totalPrice = myOrders[index].last["totalPrice"];
                          final List<dynamic> order = myOrders[index];
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
