import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';

import '../../../../core/colors/appColors.dart';
import '../../../../core/shered_widget/Icons/widgets/backIcon.dart';
import '../../../../core/shered_widget/buttons/fill_buttons/fill_button_widget.dart';
import '../../../../core/shered_widget/logo/logo.dart';
import '../../../../core/shered_widget/textfiled/textFormFieldWidgte.dart';
import '../choose_entry/chooseEntry.dart';

class SignupScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  SignupScreen({super.key});

  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        color: AppColors.bgColor,
        home: Scaffold(
          appBar: AppBar(
            leading: backIcon(Icons.arrow_back_ios, ChooseEntry()),
          ),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Container(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    appLogo(150, 150),
                    Text(
                      "Signup Screen",
                      style: TextStyle(
                          color: AppColors.midOrangeColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    ),
                    Text(
                      "Signup Screen leads to Home Screen Because not connected.",
                      style: TextStyle(
                          color: AppColors.grayColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    TextFieldWidget(
                        Icons.perm_identity, "full name", false, controller),
                    TextFieldWidget(
                        Icons.person, " username", false, controller),
                    TextFieldWidget(
                        Icons.add_location_alt, "location", false, controller),
                    TextFieldWidget(Icons.dialpad, "phone", false, controller),
                    TextFieldWidget(
                        Icons.password, "password", true, controller),
                    SizedBox(height: 30),
                    fillButton(HomeScreen(), "Signup", Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
