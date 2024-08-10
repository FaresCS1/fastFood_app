import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/models/app_info.dart';
import 'package:untitled2/features/entry/pages/login/login_screen.dart';
import 'package:untitled2/features/foods/pages/foods.dart';
import 'package:untitled2/features/foods/pages/meals.dart';

import '../../../core/colors/appColors.dart';
import '../../../core/provider/cart_provider.dart';
import '../../../core/shered_widget/logo/logo.dart';
import '../../../core/shered_widget/subtitleButton/SubtitlebuttonWidget.dart';
import '../widgets/listviewWidget.dart';
import '../widgets/mealsWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;
  @override
  void initState() {
    super.initState();
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.ResetBill();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.bgColor,
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
                                      builder: (context) => LoginScreen()));
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
                              const Icon(
                                Icons.add_location_alt,
                                color: AppColors.orangeColor,
                                size: 30,
                              )
                            ],
                          ))
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
                              image: AssetImage("assets/images/ads_cover.jpg")),
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.midOrangeColor,
                        ),
                        child: Container()),
                    subtitleWidget("Categories", const FoodsScreen()),
                    const CategoryWidget(),
                    subtitleWidget("Meals", const MealsScreen()),
                    const MealsWidget()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() {
          this.index = index;
          if (curentUser == null) {
            if (index != 3) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Pages[index]));
            }
          } else {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Pages[index]));
          }
        }),
        backgroundColor: AppColors.orangeColor,
        destinations: const [
          NavigationDestination(
              icon: Icon(
                Icons.home,
                color: AppColors.bgColor,
                size: 40,
              ),
              selectedIcon: Icon(
                Icons.home,
                color: AppColors.lightOrangeColor,
                size: 30,
              ),
              label: "Home"),
          NavigationDestination(
              icon: Icon(
                Icons.reorder,
                color: AppColors.bgColor,
                size: 40,
              ),
              selectedIcon: Icon(
                Icons.reorder,
                color: AppColors.lightOrangeColor,
                size: 30,
              ),
              label: "Orders"),
          NavigationDestination(
              icon: Icon(
                Icons.add_shopping_cart,
                color: AppColors.bgColor,
                size: 40,
              ),
              selectedIcon: Icon(
                Icons.add_shopping_cart,
                color: AppColors.lightOrangeColor,
                size: 30,
              ),
              label: "Cart"),
          NavigationDestination(
              icon: Icon(
                Icons.person,
                color: AppColors.bgColor,
                size: 40,
              ),
              selectedIcon: Icon(
                Icons.person,
                color: AppColors.lightOrangeColor,
                size: 30,
              ),
              label: "Profile"),
        ],
      ),
    );
  }
}
