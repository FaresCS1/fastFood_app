import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/routes/myRoutes.dart';
import 'core/shared_preferences/SharedPrefHelper.dart';
import 'core/dimensions/appDimension.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/provider/app_state/appState_provider.dart';
import 'core/routes/appRoute.dart';
import 'features/splash/pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppStateProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AppStateProvider>().trackInternetConnectivity();
  }

  @override
  void dispose() {
    context.read<AppStateProvider>().disposeTrack();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppDimension().init(context);
    SharedPrefsHelper.init();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: splashRoute,
      onGenerateRoute: AppRoute.generateRoute,
      home: SplashScreen(),
    );
  }
}
