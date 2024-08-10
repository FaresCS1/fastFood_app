import 'package:flutter/material.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backIcon(Icons.home, const HomeScreen()),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            "Orders & Payment Screen in Progress ... (Coming Soon)",
            style: TextStyle(color: AppColors.orangeColor, fontSize: 28),
          ),
        ),
      ),
    );
  }
}
