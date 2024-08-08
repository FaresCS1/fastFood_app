import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  List<Users> user = [];
  bool isLoading = false;
  String? errorMessage = null;

  Future<void> fetchData() async {
    isLoading = true;
    Api _api = Api();
    notifyListeners();

    try {
      user = await _api.getUsers();
    } catch (e) {
      throw Exception(e.toString());
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
