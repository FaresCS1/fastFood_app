import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:untitled2/core/models/user.dart';
import 'package:untitled2/core/provider/user_provider.dart';

import '../../../../core/colors/appColors.dart';
import '../../../../core/shered_widget/Icons/widgets/backIcon.dart';
import '../../../../core/shered_widget/textfiled/textFormFieldWidgte.dart';
import '../../widget/login_button.dart';
import '../choose_entry/chooseEntry.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController Passwordcontroller = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    List<Users> user = userProvider.user;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: AppColors.bgColor,
        home: Scaffold(
          appBar: AppBar(
            leading:
                coustmizeIconButton(Icons.arrow_back_ios, const ChooseEntry()),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  const Image(
                    image: AssetImage("assets/images/login.png"),
                    height: 300,
                    width: 300,
                  ),
                  const Text(
                    "Login Screen",
                    style: TextStyle(
                        color: AppColors.midOrangeColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 40),
                  ),
                  const SizedBox(height: 30),
                  TextFieldWidget(
                      Icons.person, "username", false, usernameController),
                  TextFieldWidget(
                      Icons.password, "password", true, Passwordcontroller),
                  const SizedBox(height: 30),
                  LoginButton(
                      context, user, usernameController, Passwordcontroller)
                ],
              ),
            ),
          ),
        ));
  }
}
