
import '../../../data/model/Response/CategoreyOrBrandResponse.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {}

class HomeTabErrorState extends HomeTabStates {
  String errorMessage;
  HomeTabErrorState({required this.errorMessage});
}

class HomeTabSuccessState extends HomeTabStates {
  CategoreyOrBrandResponse categoreyResponse;
  HomeTabSuccessState({required this.categoreyResponse});
}

//////////////////////////////////
class HomeBrandsLoadingState extends HomeTabStates {}

class HomeBrandsErrorState extends HomeTabStates {
  String errorMessage;
  HomeBrandsErrorState({required this.errorMessage});
}

class HomeBrandsSuccessState extends HomeTabStates {
  CategoreyOrBrandResponse categoreyResponse;
  HomeBrandsSuccessState({required this.categoreyResponse});
}
