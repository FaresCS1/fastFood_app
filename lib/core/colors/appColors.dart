import 'dart:ui';

class AppColors {
  static final AppColors _instance = AppColors._internal();

  factory AppColors() {
    return _instance;
  }

  AppColors._internal();

  static const bgColor = Color(0xffe8e6e6);
  static const whiteColor = Color(0xfffcfcfc);
  static const grayColor = Color(0xff919191);
  static const blackColor = Color(0xff525252);
  static const lightBlackColor = Color(00000042);
  static const orangeColor = Color(0xffFE8709);
  static const redColor = Color(0xffE32929);
  static const yellowColor = Color(0xffFFB80E);
  static const brownColor = Color(0xff792B07);

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
