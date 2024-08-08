import 'dart:ui';

import 'package:untitled2/core/models/user.dart';
import 'package:untitled2/features/cart/pages/cartScreen.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';
import 'package:untitled2/features/payment/payment_screen.dart';

import '../../features/profile/profile_screen.dart';




Users? curentUser;

List<dynamic> Pages = [
  HomeScreen(),
  PaymentScreen(),
  Cartscreen(),
  ProfileScreen()
];
