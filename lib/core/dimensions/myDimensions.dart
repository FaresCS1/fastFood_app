import 'package:untitled2/core/dimensions/appDimension.dart';

double dimensionWidth(double value) {
  return AppDimension.currentWidth * value;
}

double dimensionHeight(double value) {
  return AppDimension.currentHeight * value;
}

double dimensionFontSize(double value) {
  return value * (AppDimension.currentWidth / 4) / 100;
}
