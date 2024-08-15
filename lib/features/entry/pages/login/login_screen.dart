import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:untitled2/core/models/user.dart';
import 'package:untitled2/core/provider/user_provider.dart';
import 'package:untitled2/features/entry/pages/choose_entry/chooseEntry.dart';

import '../../../../core/colors/appColors.dart';
import '../../../../core/shered_widget/Icons/widgets/backIcon.dart';
import '../../../../core/shered_widget/textfiled/textFormFieldWidgte.dart';
import '../../widget/login_button.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController Passwordcontroller = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    List<Users> user = userProvider.user;
    double currentWidth = MediaQuery.of(context).size.width;
    double currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: coustmizeIconButton(Icons.arrow_back_ios, ChooseEntry()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: currentHeight / 50),
              Image(
                image: AssetImage("assets/images/login.png"),
                height: currentWidth / 1.5,
                width: currentHeight / 1.5,
              ),
              const Text(
                "Login Screen",
                style: TextStyle(
                    color: AppColors.midOrangeColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 40),
              ),
              SizedBox(height: currentHeight / 33),
              TextFieldWidget(
                  Icons.person, "username", false, usernameController),
              TextFieldWidget(
                  Icons.password, "password", true, Passwordcontroller),
              SizedBox(height: currentHeight / 33),
              LoginButton(context, user, usernameController, Passwordcontroller)
            ],
          ),
        ),
      ),
    );
  }
}
