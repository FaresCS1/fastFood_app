import 'package:untitled2/features/foods/pages/foods.dart';
import 'package:untitled2/features/profile/profile_screen.dart';
import 'package:untitled2/features/terms_conditions/terms_screen.dart';

import '../../features/contact/contact_us.dart';

List moreInfo = [
  {"name": "Menu", "route": FoodsScreen(type1: 'All')},
  {"name": "My Profile", "route": ProfileScreen()},
  {"name": "Terms and Conditions", "route": TermsConditionScreen()},
  {"name": "Contact Us", "route": ContactUsScreen()},
];
