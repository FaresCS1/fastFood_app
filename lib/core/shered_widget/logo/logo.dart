import 'package:flutter/cupertino.dart';

Widget appLogo(double width, double height) {
  return Image(
    image: AssetImage("assets/images/logo.png"),
    height: height,
    width: width,
  );
}

Widget appLogoWhite(double width, double height) {
  return Image(
    image: AssetImage("assets/images/whiteLogo.png"),
    height: height,
    width: width,
  );
}
