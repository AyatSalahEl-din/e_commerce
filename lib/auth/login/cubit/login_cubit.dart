
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_manager.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginIntialState());
  //todo: hold data - handle logic

  TextEditingController emailController =
      TextEditingController(text: 'ayat@gmail.com');

  TextEditingController passController = TextEditingController(text: '123456');

  bool passwordVisible = false;
  var formKey = GlobalKey<FormState>();
  Future<void> login() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(LoginLoadingState());
        var response = await ApiManager.login(
          emailController.text,
          passController.text,
        );
        if (response.statusMsg == 'fail') {
          emit(LoginErrorState(errorMessage: response.message!));
        } else {
          emit(LoginSuccessState(response: response));
        }
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    }
  }
}
