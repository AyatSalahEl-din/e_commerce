import 'dart:convert';

import 'package:e_commerce/data/model/end_point.dart';
import 'package:e_commerce/user/RegisterResponse.dart';
import 'package:e_commerce/user/register_requist.dart';
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
    var registerRequest = RegisterRequist(
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
}
