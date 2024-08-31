import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/core/constants/myRoutes.dart';
import 'package:untitled2/features/cart/pages/cartScreen.dart';
import 'package:untitled2/features/checkOut/checkOut_screen.dart';
import 'package:untitled2/features/contact/contact_us.dart';
import 'package:untitled2/features/entry/pages/login/login_screen.dart';
import 'package:untitled2/features/entry/pages/login/rest_password.dart';
import 'package:untitled2/features/entry/pages/signup/signUp.dart';
import 'package:untitled2/features/foods/pages/foodInfo.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';
import 'package:untitled2/features/more/pages/more_screen.dart';
import 'package:untitled2/features/offers/offers_screen.dart';
import 'package:untitled2/features/profile/profile_screen.dart';
import 'package:untitled2/features/terms_conditions/terms_screen.dart';

import '../../features/foods/pages/menu.dart';
import '../../features/splash/pages/splachPages.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case restPasswordRoute:
        return MaterialPageRoute(builder: (_) => RestPassword());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case offersRoute:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case moreRoute:
        return MaterialPageRoute(builder: (_) => const MoreScreen());
      case menuRoute:
        if (args is String) {
          return MaterialPageRoute(
              builder: (_) => MenuScreen(
                    type: args,
                  ));
        }
      case foodInfoRoute:
        if (args is Map) {
          return MaterialPageRoute(
            builder: (_) => FoodInfo(
              foodInfo: args,
            ),
          );
        }
      case checkOutRoute:
        return MaterialPageRoute(builder: (_) => const CheckOutScreen());
      case profileRoute:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case contactRoute:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());
      case termsConditionsRoute:
        return MaterialPageRoute(builder: (_) => const TermsConditionScreen());
    }
    return _errorRoute();
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error Route'),
        ),
        body: Center(
          child: Text('ERROR Route'),
        ),
      );
    });
  }
}
