import 'dart:convert';

import 'package:e_commerce/data/end_point.dart';
import 'package:e_commerce/data/model/Requests/LoginRequest.dart';
import 'package:e_commerce/data/model/Response/CategoreyResponse.dart';
import 'package:e_commerce/data/model/Response/LoginResponse.dart';
import 'package:e_commerce/data/model/Response/RegisterResponse.dart';
import 'package:e_commerce/data/model/Requests/RegisterRequest.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static const String baseUrl = 'ecommerce.routemisr.com';
  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
  */

  static Future<RegisterResponse> register(
    String name,
    String email,
    String password,
    String phone,
    String rePassword,
  ) async {
    Uri url = Uri.https(baseUrl, EndPoints.signUp);
    var registerRequest = RegisterRequest(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword,
    );
    try {
      var response = await http.post(url,
          body: registerRequest.toJson()); //momkn a3ml map 3la tol fe body
      var bodyString = response.body; //string
      var json = jsonDecode(bodyString); //json
      return RegisterResponse.fromJson(json);
    } catch (e) {
      //error client
      throw e;
    }
    // User.fromJson(jsonDecode(response.body));
    //instead of the past 3 lines
  }

  static Future<LoginResponse> login(String email, String password) async {
    Uri url = Uri.https(baseUrl, EndPoints.login);
    LoginRequest loginRequest = LoginRequest(
      email: email,
      password: password,
    );
    try {
      var response = await http.post(url, body: loginRequest.toJson());
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return LoginResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoreyResponse> getAllCategories() async {
    Uri url = Uri.https(baseUrl, EndPoints.getAllCategories);
    http.get(url);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoreyResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
