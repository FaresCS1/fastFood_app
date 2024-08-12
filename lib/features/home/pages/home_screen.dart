import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/models/app_info.dart';
import 'package:untitled2/core/shered_widget/bottomBar/bottomBar.dart';
import 'package:untitled2/features/entry/pages/login/login_screen.dart';
import 'package:untitled2/features/foods/pages/foods.dart';
import 'package:untitled2/features/foods/pages/meals.dart';
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
    return ChangeNotifierProvider(
      create: (_) => BottomBarProvider(),
      child: Builder(
        builder: (context) {
          final bottomBarProvider = Provider.of<BottomBarProvider>(context);
          return Scaffold(
            body: Stack(
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
                            margin: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                appLogo(70, 70),
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
                                          ? const Icon(
                                              Icons.login,
                                              color: AppColors.orangeColor,
                                              size: 30,
                                            )
                                          : const Icon(
                                              Icons.add_location_alt,
                                              color: AppColors.orangeColor,
                                              size: 30,
                                            ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Container(
                                height: 155,
                                width: double.infinity,
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
                              subtitleWidget("Categories", const FoodsScreen()),
                              const CategoryWidget(),
                              subtitleWidget("Meals", const MealsScreen()),
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
            ),
          );
        },
      ),
    );
  }
}
