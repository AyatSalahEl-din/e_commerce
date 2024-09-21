import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/api_manager.dart';
import '../../../data/model/Response/CategoreyOrBrandResponse.dart';
import 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabStates> {
  HomeTabCubit() : super(HomeTabInitialState());

  //hold data , handle logic
  List<CategoryOrBrand>? categoriesList;
  List<CategoryOrBrand>? brandsList;

  void getAllCategories() async {
    try {
      emit(HomeTabLoadingState());
      var response = await ApiManager.getAllCategories();
      if (response.statusMsg == 'fail') {
        emit(HomeTabErrorState(errorMessage: response.message!));
      }
      else{

      categoriesList = response.data!;
      if(categoriesList!=null) {
          emit(HomeTabSuccessState(categoreyResponse: response));
        }
      }
    }
    catch(e){
      emit(HomeTabErrorState(errorMessage: e.toString()));
    }
  }

  void getAllBrands() async {
    emit(HomeBrandsLoadingState());
    try{
      var response = await ApiManager.getAllBrands();
      if (response.statusMsg == 'fail') {
        emit(HomeBrandsErrorState(errorMessage: response.message!));
      } else {
        brandsList = response.data!;
        if (brandsList != null) {
          emit(HomeBrandsSuccessState(categoreyResponse: response));
        }
      }
    } catch(e)
    {
      emit(HomeBrandsErrorState(errorMessage: e.toString()));
    }
  }
}
