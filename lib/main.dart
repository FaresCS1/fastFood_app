import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/provider/cart_provider.dart';
import 'package:untitled2/features/splach/pages/splachPages.dart';
import 'core/provider/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()..fetchData()),
        ChangeNotifierProvider(create: (_) => CartProvider()..ResetBill())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Splachpage());
  }
}
