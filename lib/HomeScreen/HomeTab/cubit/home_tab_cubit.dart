import 'package:e_commerce/HomeScreen/HomeTab/cubit/home_tab_state.dart';
import 'package:e_commerce/data/api_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabCubit extends Cubit<HomeTabStates> {
  HomeTabCubit() : super(HomeTabInitialState());

  //hold data , handle logic
  List<Category>? categoriesList;

  void getAllCategories() async {
    try {
      emit(HomeTabLoadingState());
      var response = await ApiManager.getAllCategories();
      if (response.statusMsg == 'fail') {
        emit(HomeTabErrorState(errorMessage: response.message!));
      } else {
        categoriesList = response.data ?? [];
        if (categoriesList != null) {
          emit(HomeTabSuccessState(categoreyResponse: response));
        }
      }
    } catch (e) {
      emit(HomeTabErrorState(errorMessage: e.toString()));
    }
  }
}
