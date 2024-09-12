import 'package:e_commerce/data/model/Response/CategoreyResponse.dart';

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class HomeTabLoadingState extends HomeTabStates {}

class HomeTabErrorState extends HomeTabStates {
  String errorMessage;
  HomeTabErrorState({required this.errorMessage});
}

class HomeTabSuccessState extends HomeTabStates {
  CategoreyResponse categoreyResponse;
  HomeTabSuccessState({required this.categoreyResponse});
}
