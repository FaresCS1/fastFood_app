import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/models/app_info.dart';
import 'package:untitled2/core/shered_widget/bottomBar/bottomBar.dart';
import 'package:untitled2/features/entry/pages/login/login_screen.dart';
import 'package:untitled2/features/foods/pages/foods.dart';
import 'package:untitled2/features/home/widgets/listviewWidget.dart';

import '../../../core/provider/bottomBar_provider.dart';
import '../../../core/shered_widget/logo/logo.dart';
import '../../../core/shered_widget/subtitleButton/SubtitlebuttonWidget.dart';
import '../widgets/mealsWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => BottomBarProvider(),
        child: Builder(
          builder: (context) {
            return Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  color: AppColors.bgColor,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: currentHeight / 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                appLogo(currentWidth / 6, currentHeight / 12),
                                InkWell(
                                  onTap: () {
                                    if (curentUser?.address["city"] == null) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                        ),
                                      );
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        curentUser?.address["city"] == null
                                            ? "Login now !!"
                                            : curentUser?.address["city"],
                                        style: const TextStyle(fontSize: 20),
                                      ),
                                      curentUser?.address["city"] == null
                                          ? Icon(
                                              Icons.login,
                                              color: AppColors.orangeColor,
                                              size: currentWidth / 15,
                                            )
                                          : Icon(
                                              Icons.add_location_alt,
                                              color: AppColors.orangeColor,
                                              size: currentWidth / 15,
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: currentHeight / 50),
                          Column(
                            children: [
                              Container(
                                height: currentHeight / 6,
                                width: currentWidth,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/ads_cover.jpg"),
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                  color: AppColors.midOrangeColor,
                                ),
                              ),
                              subtitleWidget(
                                  "Categories", FoodsScreen(type: 'All')),
                              const CategoryWidget(),
                              subtitleWidget(
                                  "Meals", FoodsScreen(type: 'Meals')),
                              const MealsWidget(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Consumer<BottomBarProvider>(
                    builder: (context, state, _) =>
                        myBottombar(state, context)),
              ],
            );
          },
        ),
      ),
    );
  }
}
