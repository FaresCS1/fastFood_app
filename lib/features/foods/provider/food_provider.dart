import 'package:flutter/material.dart';

import '../data/foodMenu_info.dart';

class FoodProvider extends ChangeNotifier {
  List foodItem = allFoodInfo;
  String type = "";
  int indexType = 0;

  ScrollController scrollController = ScrollController();

  void selectedType(String selectedType) {
    type = selectedType;
    foodType();
    Future.microtask(() => notifyListeners());
  }

  void typeToIndex(String selectedType) {
    for (int i = 0; i > foodsCategory.length; ++i) {
      if (foodsCategory[i]["type"] == selectedType) {
        indexType = i;
      }
    }
  }

  void scrollToIndex(int index) {
    scrollController.animateTo(
      index * 110.0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void foodType() {
    if (type == "Meals") {
      foodItem = mealsInfo;
    } else if (type == "Burger") {
      foodItem = burgerInfo;
    } else if (type == "Sandwich") {
      foodItem = sandwichInfo;
    } else if (type == "Fries") {
      foodItem = friesInfo;
    } else if (type == "Drinks") {
      foodItem = drinksInfo;
    } else {
      //All food
      foodItem = allFoodInfo;
    }
  }
}
