import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/routes/myRoutes.dart';
import 'package:untitled2/core/sheared_widget/bottomBar/widget/bottomBar.dart';
import 'package:untitled2/features/home/widgets/category_widget.dart';

import '../../../core/shared_preferences/SharedPrefHelper.dart';
import '../../../core/dimensions/myDimensions.dart';
import '../../../core/sheared_widget/bottomBar/provider/bottomBar_provider.dart';
import '../../../core/sheared_widget/bottomBar/widget/float_cartIcon.dart';
import '../../../core/sheared_widget/logo/logo.dart';
import '../../../core/sheared_widget/subtitleButton/SubtitlebuttonWidget.dart';
import '../../offers/widget/offers_widget.dart';
import '../widgets/meals_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FirebaseAuth.instance.currentUser != null
          ? const FloatCartIcon()
          : null,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: appLogo(dimensionWidth(0.20), dimensionHeight(0.20)),
        actions: [
          InkWell(
            onTap: () {
              FirebaseAuth.instance.currentUser != null
                  ? Navigator.of(context).pushNamed(profileRoute)
                  : Navigator.of(context)
                      .pushNamedAndRemoveUntil(loginRoute, (route) => false);
            },
            child: Row(
              children: [
                Text(
                  FirebaseAuth.instance.currentUser != null
                      ? SharedPrefsHelper.getString("location")!
                      : "Login now",
                  style: TextStyle(fontSize: dimensionFontSize(18)),
                ),
                FirebaseAuth.instance.currentUser != null
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const OffersWidget(dirHorizontal: true),
                    subtitleNavigateWidget("Categories", menuRoute),
                    const CategoryWidget(),
                    subtitleNavigateWidget("Meals", menuRoute),
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
                  return myBottomBar(bottomBarProvider, context);
                });
              }))
        ],
      ),
    );
  }
}
