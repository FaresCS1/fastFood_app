import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/shered_widget/Icons/widgets/backIcon.dart';
import 'package:untitled2/core/shered_widget/logo/logo.dart';
import 'package:untitled2/features/home/pages/home_screen.dart';

import '../../../core/models/moreInfo.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
          leading: coustmizeIconButton(Icons.arrow_back_ios, HomeScreen()),
        ),
        backgroundColor: AppColors.bgColor,
        body: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Column(
            children: [
              Container(
                height: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    appLogo(100, 100),
                    const Text(
                      "Fast food \n faster smiles!",
                      style: TextStyle(
                          color: AppColors.lightOrangeColor,
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 500,
                child: ListView.separated(
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(),
                  itemCount: moreInfo.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(moreInfo[index]["name"]),
                      titleTextStyle:
                          TextStyle(fontSize: 23, color: AppColors.blackColor),
                      trailing: coustmizeIconButton(
                          Icons.arrow_forward_ios_outlined,
                          moreInfo[index]["route"]),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
