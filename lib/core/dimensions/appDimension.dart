import 'package:flutter/cupertino.dart';

class AppDimension {
  static final AppDimension _instance = AppDimension._internal();
  late BuildContext _context;
  static double _currentWidth = 0.0;
  static double _currentHeight = 0.0;

  factory AppDimension() {
    return _instance;
  }

  AppDimension._internal();

  void init(BuildContext context) {
    _context = context;
    _currentWidth = MediaQuery.of(_context).size.width;
    _currentHeight = MediaQuery.of(_context).size.height;
  }

  static double get currentWidth => _currentWidth;
  static double get currentHeight => _currentHeight;
}
