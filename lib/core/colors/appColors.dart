import 'dart:ui';

class AppColors {
  static final AppColors _instance = AppColors._internal();

  factory AppColors() {
    return _instance;
  }

  AppColors._internal();

  static const bgColor = Color(0xffe8e6e6);
  static const whiteColor = Color(0xfffcfcfc);
  static const lightGrayColor = Color(0xffd5d5d5);
  static const grayColor = Color(0xff919191);
  static const blackColor = Color(0xff525252);
  static const orangeColor = Color(0xffFE8709);
  static const redColor = Color(0xffE32929);
  static const yellowColor = Color(0xffFFC238);
  static const yellowWarningColor = Color(0xffffe223);
  static const greenColor = Color(0xff3bd328);
  static const darkGreenColor = Color(0xff229816);
  static const lightRedColor = Color(0xffe16b5c);
  static const midOrangeColor = Color(0xfff39060);
  static const lightOrangeColor = Color(0xffffb56b);
  static const beigeColor = Color(0xffFEEDCF);
}

List<Color> lightColors = [
  AppColors.yellowColor,
  AppColors.lightOrangeColor,
  AppColors.midOrangeColor,
  AppColors.lightRedColor,
];
