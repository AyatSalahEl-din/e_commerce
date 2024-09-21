import 'package:e_commerce/HomeScreen/HomeTab/cubit/home_tab_state.dart';
import 'package:e_commerce/data/api_manager.dart';
import 'package:e_commerce/data/model/Response/CategoreyOrBrandResponse.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTabCubit extends Cubit<HomeTabStates> {
  HomeTabCubit() : super(HomeTabInitialState());

  //hold data , handle logic
  List<CategoryOrBrand>? categoriesList;
  List<CategoryOrBrand>? brandsList;

  void getAllCategories() async {
    emit(HomeTabLoadingState());
    var response = await ApiManager.getAllCategories();
    if (response.statusMsg == 'fail') {
      emit(HomeTabErrorState(errorMessage: response.message!));
      return;
    }
    categoriesList = response.data!;
    emit(HomeTabSuccessState(categoreyResponse: response));
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    var response = await ApiManager.getAllBrands();
    if (response.statusMsg == 'fail') {
      emit(HomeBrandsErrorState(errorMessage: response.message!));
      return;
    }
    brandsList = response.data!;
    emit(HomeBrandsSuccessState(categoreyResponse: response));
  }
}
