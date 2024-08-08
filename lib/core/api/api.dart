import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class Api {
  Future<List<Users>> getUsers() async {
    String url = "https://jsonplaceholder.typicode.com/users";

    var respone = await http.get(Uri.parse(url));

    if (respone.statusCode == 200) {
      List<dynamic> data = json.decode(respone.body);
      return data.map((json) => Users.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load");
    }
  }
}
