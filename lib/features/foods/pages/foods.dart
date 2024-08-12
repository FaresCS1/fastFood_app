import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/features/foods/pages/foodsInfo.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';

import '../../../core/models/foodMenu_info.dart';

class FoodsScreen extends StatelessWidget {
  const FoodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.bgColor,
          leading:
              coustmizeIconButton(Icons.arrow_back_ios, const HomeScreen()),
          title: const Text(
            "Foods",
            style: TextStyle(
              fontSize: 30,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Container(
          color: AppColors.bgColor,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: foodInfo.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Foodsinfo(
                                    foodInfo: foodInfo[index],
                                    route: const FoodsScreen(),
                                  )));
                    });
                  },
                  child: Card(
                    color: AppColors.whiteColor,
                    child: Column(
                      children: [
                        Image.asset(
                          foodInfo[index]["img"],
                          width: 130,
                          height: 130,
                        ),
                        Text(
                          foodInfo[index]["name"],
                          style: const TextStyle(
                            color: AppColors.orangeColor,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                                "${foodInfo[index]["price"].toString()} price"),
                            Row(
                              children: [
                                Text(foodInfo[index]["rate"].toString()),
                                const Icon(
                                  Icons.star,
                                  color: AppColors.yellowColor,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
