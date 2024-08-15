import 'package:flutter/material.dart';

import '../models/foodMenu_info.dart';

class FoodProvider extends ChangeNotifier {
  List foodItem = foodInfo;
  String type = "";
  int indexType = 0;

  ScrollController scrollController = ScrollController();

  void selectedType(String selectedType) {
    type = selectedType;
    foodType();
    notifyListeners();
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
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  List foodType() {
    if (type != "All") {
      List filteredList = [];
      for (int i = 0; i < foodInfo.length; ++i) {
        if (foodInfo[i]["type"] == type) {
          filteredList.add(foodInfo[i]);
        }
      }
      foodItem = filteredList;
      return foodItem;
    }
    foodItem = foodInfo;
    return foodInfo;
  }
}
