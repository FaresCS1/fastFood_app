import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/dimensions/myDimensions.dart';
import 'package:untitled2/core/sheared_widget/bottomBar/provider/bottomBar_provider.dart';

import '../../../core/sheared_widget/bottomBar/widget/float_cartIcon.dart';
import '../provider/food_provider.dart';
import '../../../core/sheared_widget/bottomBar/widget/bottomBar.dart';
import '../widgets/menu/food_menu_grid.dart';
import '../widgets/menu/food_category_scroll.dart';

class MenuScreen extends StatelessWidget {
  late String type;
  MenuScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FirebaseAuth.instance.currentUser != null
          ? const FloatCartIcon()
          : null,
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        backgroundColor: AppColors.bgColor,
        title: Text(
          "Foods",
          style: TextStyle(
              color: AppColors.orangeColor,
              fontSize: dimensionFontSize(28),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) {
              final foodProvider = FoodProvider();
              foodProvider.selectedType(type);
              return foodProvider;
            }),
          ],
          child: Builder(builder: (context) {
            final foodProvider = Provider.of<FoodProvider>(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    color: AppColors.bgColor,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        foodCategoryScroll(foodProvider),
                        Expanded(child: foodMenu(foodProvider)),
                      ],
                    ),
                  ),
                ),
                ChangeNotifierProvider(
                    create: (_) => BottomBarProvider(),
                    child: Consumer<BottomBarProvider>(
                        builder: (context, bottomBarProvider, _) {
                      return Builder(builder: (context) {
                        bottomBarProvider.Index = 2;
                        return myBottomBar(bottomBarProvider, context);
                      });
                    }))
              ],
            );
          })),
    );
  }
}
