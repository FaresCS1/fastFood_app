import 'package:flutter/material.dart';
import 'package:untitled2/core/routes/myRoutes.dart';
import 'package:untitled2/features/cart/pages/cartScreen.dart';
import 'package:untitled2/features/checkOut/pages/checkOut_screen.dart';
import 'package:untitled2/features/contact/pages/contact_us.dart';
import 'package:untitled2/features/foods/pages/foodInfo_screen.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';
import 'package:untitled2/features/more/pages/more_screen.dart';
import 'package:untitled2/features/offers/pages/offers_screen.dart';
import 'package:untitled2/features/orders/pages/order_screen.dart';
import 'package:untitled2/features/orders/pages/orders_details_screen.dart';
import 'package:untitled2/features/profile/pages/profile_screen.dart';
import 'package:untitled2/features/terms_conditions/pages/terms_screen.dart';

import '../../features/auth/login/pages/login_screen.dart';
import '../../features/auth/reset_password/pages/rest_password.dart';
import '../../features/auth/signUp/pages/signUp.dart';
import '../../features/foods/pages/menu_screen.dart';
import '../../features/splash/pages/splash_screen.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? args = settings.arguments;

    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case restPasswordRoute:
        return MaterialPageRoute(builder: (_) => RestPasswordScreen());
      case homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case ordersRoute:
        return MaterialPageRoute(builder: (_) => const OrdersScreen());
      case offersRoute:
        return MaterialPageRoute(builder: (_) => const OffersScreen());
      case cartRoute:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case moreRoute:
        return MaterialPageRoute(builder: (_) => MoreScreen());
      case orderDetailsRoute:
        if (args is List) {
          return MaterialPageRoute(
              builder: (_) => OrderDetailsScreen(
                    orderInfo: args,
                  ));
        }
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
            builder: (_) => FoodInfoScreen(
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
          title: const Text('Error Route'),
        ),
        body: const Center(
          child: Text('ERROR Route'),
        ),
      );
    });
  }
}
