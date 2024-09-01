import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/constants/myRoutes.dart';
import 'package:untitled2/core/shered_widget/bottomBar/bottomBar.dart';
import 'package:untitled2/features/home/widgets/listviewWidget.dart';

import '../../../core/classes/shared_preferences/SharedPrefHelper.dart';
import '../../../core/dimensions/myDimensions.dart';
import '../../../core/provider/bottomBar_provider.dart';
import '../../../core/shered_widget/logo/logo.dart';
import '../../../core/shered_widget/subtitleButton/SubtitlebuttonWidget.dart';
import '../../offers/widget/offersWidget.dart';
import '../widgets/mealsWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SharedPrefsHelper.getBool("login") == true
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
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: appLogo(dimensionWidth(0.20), dimensionHeight(0.20)),
        actions: [
          InkWell(
            onTap: () {
              SharedPrefsHelper.getBool("login")!
                  ? Navigator.of(context).pushNamed(profileRoute)
                  : Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (route) => false);
            },
            child: Row(
              children: [
                Text(
                  SharedPrefsHelper.getBool("login")!
                      ? SharedPrefsHelper.getString("location")!
                      : "Login now",
                  style: TextStyle(fontSize: dimensionFontSize(18)),
                ),
                SharedPrefsHelper.getBool("login")!
                    ? Icon(
                        Icons.add_location_alt,
                        color: AppColors.orangeColor,
                        size: dimensionWidth(0.10),
                      )
                    : Icon(
                        Icons.login,
                        color: AppColors.orangeColor,
                        size: dimensionWidth(0.10),
                      ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Container(
              height: dimensionHeight(0.75),
              padding: EdgeInsets.symmetric(horizontal: 10),
              color: AppColors.bgColor,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const OffersWidget(dirHorizontal: true),
                    subtitleWidget("Categories", menuRoute),
                    const CategoryWidget(),
                    subtitleWidget("Meals", menuRoute),
                    const MealsWidget(),
                  ],
                ),
              ),
            ),
          ),
          ChangeNotifierProvider(
              create: (_) => BottomBarProvider(),
              child: Consumer<BottomBarProvider>(
                  builder: (context, bottomBarProvider, _) {
                return Builder(builder: (context) {
                  bottomBarProvider.Index = 0;
                  return myBottombar(bottomBarProvider, context);
                });
              }))
        ],
      ),
    );
  }
}
