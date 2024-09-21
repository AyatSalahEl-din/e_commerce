import 'package:e_commerce/auth/register/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_manager.dart';

//3ayza adelo state : loading aw error aw success w kda<>
//h3ml class w asmeh register state w a7ot feh elstates btat3ty
//<>hadelo elparent 34an y2bl ay 7aga tany
class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  //Hold data , handle logic
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  TextEditingController repassController = TextEditingController();

  TextEditingController mobileController = TextEditingController();

  bool passwordVisible = false;
  Future<void> register() async {
    try {
      //emit == state now loading
      emit(RegisterLoadingState());
      var response = await ApiManager.register(
        nameController.text,
        emailController.text,
        passController.text,
        mobileController.text,
        repassController.text,
      );
      if (response.statusMsg == 'fail') {
        emit(RegisterErrorState(errorMessage: response.message!));
      } else {
        emit(RegisterSuccessState(response: response));
      }
    } catch (e) {
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
  }
}
