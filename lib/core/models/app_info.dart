import 'package:flutter/material.dart';
import 'package:untitled2/core/models/user.dart';
import 'package:untitled2/features/cart/pages/cartScreen.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';
import 'package:untitled2/features/more/pages/more_screen.dart';

import '../../features/offers/offers_screen.dart';

Users? curentUser;

List<dynamic> Pages = [
  const HomeScreen(),
  const OffersScreen(),
  const CartScreen(),
  const MoreScreen()
];
