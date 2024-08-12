import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/core/colors/appColors.dart';
import 'package:untitled2/core/provider/splach_provider.dart';
import 'package:untitled2/features/entry/pages/choose_entry/chooseEntry.dart';

import '../../../core/shered_widget/logo/logo.dart';

class Splachpage extends StatelessWidget {
  const Splachpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplachProvider(),
      child: Builder(
        builder: (context) {
          final splachProvider =
              Provider.of<SplachProvider>(context, listen: false);
          splachProvider.startDelayedNavigation();

          return Material(
            child: Consumer<SplachProvider>(
              builder: (context, state, _) {
                if (state.shouldNavigate) {
                  WidgetsBinding.instance!.addPostFrameCallback((_) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseEntry()),
                    );
                  });
                }

                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
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
            ),
          );
        },
      ),
    );
  }
}
