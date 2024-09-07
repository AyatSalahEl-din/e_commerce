import 'dart:convert';

import 'package:collection/collection.dart';

class RegisterRequist {
  final String? name;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? phone;

  const RegisterRequist({
    this.name,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  });

  @override
  String toString() {
    return 'RegisterRequist(name: $name, email: $email, password: $password, rePassword: $rePassword, phone: $phone)';
  }

  factory RegisterRequist.fromMap(Map<String, dynamic> data) {
    return RegisterRequist(
      name: data['name'] as String?,
      email: data['email'] as String?,
      password: data['password'] as String?,
      rePassword: data['rePassword'] as String?,
      phone: data['phone'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'password': password,
        'rePassword': rePassword,
        'phone': phone,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [RegisterRequist].
  factory RegisterRequist.fromJson(String data) {
    return RegisterRequist.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [RegisterRequist] to a JSON string.
  String toJson() => json.encode(toMap());

  RegisterRequist copyWith({
    String? name,
    String? email,
    String? password,
    String? rePassword,
    String? phone,
  }) {
    return RegisterRequist(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
      phone: phone ?? this.phone,
    );
  }
}
