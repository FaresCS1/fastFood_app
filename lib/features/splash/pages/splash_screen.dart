import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';

import '../../../core/shared_preferences/SharedPrefHelper.dart';
import '../../../core/routes/myRoutes.dart';
import '../../../core/sheared_widget/logo/logo.dart';
import '../provider/splash_provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (_) => SplashProvider(),
        child: Builder(
          builder: (context) {
            final splashProvider =
                Provider.of<SplashProvider>(context, listen: false);
            splashProvider.startDelayedNavigation();
            return Consumer<SplashProvider>(
              builder: (context, state, _) {
                if (state.shouldNavigate) {
                  final dynamic route;
                  if (SharedPrefsHelper.getBool("login") != null) {
                    route = SharedPrefsHelper.getBool("login")!
                        ? homeRoute
                        : loginRoute;
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil(route, (route) => false);
                    });
                  } else {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          loginRoute, (route) => false);
                    });
                  }
                }
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.lightOrangeColor,
                        AppColors.midOrangeColor
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Center(child: appLogoWhite(500, 500)),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
