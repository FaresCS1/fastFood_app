import 'package:flutter/cupertino.dart';

Widget appLogo(double width, double height) {
  return Image(
    image: const AssetImage("assets/images/others/logo.png"),
    height: height,
    width: width,
  );
}

Widget appLogoWhite(double width, double height) {
  return Image(
    image: const AssetImage("assets/images/others/whiteLogo.png"),
    height: height,
    width: width,
  );
}
