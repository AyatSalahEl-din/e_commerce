//polymorphism
import 'package:e_commerce/data/model/Response/RegisterResponse.dart';

abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterErrorState extends RegisterState {
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterState {
  RegisterResponse response;
  RegisterSuccessState({required this.response});
}
