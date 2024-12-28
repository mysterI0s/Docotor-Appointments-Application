import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/login_model.dart';
import '../models/register_model.dart';

class AuthServerManager {
  String baseUrl = 'http://testflutter.aboodm.com/api';

  Future<LoginModel> login(String email, String password) async {
    Map<String, String> myData = {"email": email, "password": password};
    final http.Response response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: myData,
      headers: {"Accept": "application/json"},
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return LoginModel.fromJson(data);
    } else {
      throw (data["message"]);
    }
  }

  Future<RegisterModel> register(String email, String name, String password,
      String confirmPassword) async {
    Map<String, String> myData = {
      "email": email,
      "name": name,
      "password": password,
      "password_confirmation": confirmPassword
    };
    final http.Response response = await http.post(
      Uri.parse('$baseUrl/register'),
      body: myData,
      headers: {"Accept": "application/json"},
    );
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return RegisterModel.fromJson(data);
    } else {
      throw (data["message"]);
    }
  }
}
