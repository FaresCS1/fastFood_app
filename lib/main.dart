import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/provider/cart_provider.dart';

import 'core/provider/user_provider.dart';
import 'features/splach/pages/splachPages.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()..fetchData()),
        ChangeNotifierProvider(create: (_) => CartProvider()..ResetBill())
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Splachpage());
  }
}
