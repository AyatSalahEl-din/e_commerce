import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_preferences.dart';
import 'end_point.dart';
import 'model/Requests/LoginRequest.dart';
import 'model/Requests/RegisterRequest.dart';
import 'model/Response/AddCartResponse.dart';
import 'model/Response/AddToWishListResponse.dart';
import 'model/Response/CategoreyOrBrandResponse.dart';
import 'model/Response/GetCartResponse.dart';
import 'model/Response/GetWishListResponse.dart';
import 'model/Response/LoginResponse.dart';
import 'model/Response/ProductResponse.dart';
import 'model/Response/RegisterResponse.dart';
import 'model/failures.dart';

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
      var loginResponse = LoginResponse.fromJson(json);
      //el satr da lw m4 3awzeno kan momkn n7to fe login zat nafso
      SharedPreferencesUtils.saveData(key: 'token', value: loginResponse.token);
      return loginResponse;
    } catch (e) {
      throw e;
    }
  }

//////////////////////////////////////////////////////////
  static Future<CategoreyOrBrandResponse> getAllCategories() async {
    Uri url = Uri.https(baseUrl, EndPoints.getAllCategories);
    try
    {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoreyOrBrandResponse.fromJson(json);
    }catch(e)
    {
      throw e;
    }
  }

  static Future<CategoreyOrBrandResponse> getAllBrands() async {
    Uri url = Uri.https(baseUrl, EndPoints.getAllBrands);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return CategoreyOrBrandResponse.fromJson(json);
    }catch(e)
    {
      throw e;
    }
  }

////////////////////////////////////////////////////////////////
  static Future<ProductResponse> getAllProducts() async {
    Uri url = Uri.https(baseUrl, EndPoints.getAllProducts);

    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return ProductResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

///////////////////////////////////////////////////////////////
  static Future<Either<Failures, AddCartResponse>> addToCart(
      String productId) async {
    Uri url = Uri.https(baseUrl, EndPoints.addToCart);
    try {
      var token = SharedPreferencesUtils.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var addToCartResponse = AddCartResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetCartResponse>> getCart() async {
    Uri url = Uri.https(baseUrl, EndPoints.addToCart);
    try {
      var token = SharedPreferencesUtils.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var getCartResponse = GetCartResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetCartResponse>> deleteItemInCart(
      String productId) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.addToCart}/$productId');
    try {
      var token = SharedPreferencesUtils.getData(key: 'token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var deleteItemInCart = GetCartResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemInCart);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteItemInCart.message!));
      } else {
        return Left(ServerError(errorMessage: deleteItemInCart.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetCartResponse>> updateCountInCart(
      String productId, int count) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.addToCart}/$productId');
    try {
      var token = SharedPreferencesUtils.getData(key: 'token');
      var response = await http.put(url,
          headers: {'token': token.toString()}, body: {'count': '$count'});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var updateCountInCartResponse = GetCartResponse.fromJson(json);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateCountInCartResponse);
      } else if (response.statusCode == 401) {
        return Left(
            ServerError(errorMessage: updateCountInCartResponse.message!));
      } else {
        return Left(
            ServerError(errorMessage: updateCountInCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

///////////////////////////////////////////////////////////////////////////
  static Future<Either<Failures, GetWishlistResponse>> getWishList() async {
    Uri url = Uri.https(baseUrl, EndPoints.addToWishList);
    try {
      var token = SharedPreferencesUtils.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var getWishlistResponse = GetWishlistResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getWishlistResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: getWishlistResponse.message!));
      } else {
        return Left(ServerError(errorMessage: getWishlistResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  ////////addTowishhh
  static Future<Either<Failures, AddToWishlistResponse>> addItemToWishList(
      String productId) async {
    Uri url = Uri.https(baseUrl, EndPoints.addToWishList);
    try {
      var token = SharedPreferencesUtils.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var addToCartResponse = AddToWishlistResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addToCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      } else {
        return Left(ServerError(errorMessage: addToCartResponse.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  /////////delteeeee
  static Future<Either<Failures, GetWishlistResponse>> deleteItemFromWishList(
      String productId) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.addToWishList}/$productId');
    try {
      var token = SharedPreferencesUtils.getData(key: 'token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var deleteItemFromWishlist = GetWishlistResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemFromWishlist);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: deleteItemFromWishlist.message!));
      } else {
        return Left(ServerError(errorMessage: deleteItemFromWishlist.message!));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
