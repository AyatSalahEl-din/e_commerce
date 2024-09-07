import 'dart:convert';

import 'package:collection/collection.dart';

import 'RegisterResponse.dart';

class RegisterResponse {
  final String? message;
  final RegisterResponse? user;
  final String? token;
  final String? statusMsg;

  const RegisterResponse({this.message, this.user, this.token, this.statusMsg});

  @override
  String toString() => 'User(message: $message, user: $user, token: $token)';

  factory RegisterResponse.fromMap(Map<String, dynamic> data) =>
      RegisterResponse(
        message: data['message'] as String?,
        user: data['user'] == null
            ? null
            : RegisterResponse.fromMap(data['user'] as Map<String, dynamic>),
        token: data['token'] as String?,
        statusMsg: data['statusMsg'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'message': message,
        'user': user?.toMap(),
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RegisterResponse].
  factory RegisterResponse.fromJson(String data) {
    return RegisterResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  RegisterResponse copyWith({
    String? message,
    RegisterResponse? user,
    String? token,
  }) {
    return RegisterResponse(
      message: message ?? this.message,
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}
