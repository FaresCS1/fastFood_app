import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../colors/appColors.dart';

class BackEvent extends StatelessWidget {
  const BackEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pop(context);
        });
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: AppColors.midOrangeColor,
        size: 30,
      ),
    );
  }
}
