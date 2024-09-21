

import '../../data/model/Response/AddCartResponse.dart';
import '../../data/model/Response/ProductResponse.dart';
import '../../data/model/failures.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductErrorState extends ProductStates {
  String errorMessage;
  ProductErrorState({required this.errorMessage});
}

class ProductSuccessState extends ProductStates {
  //hna m3aya response kolo m4 list bs
  ProductResponse productResponse;
  ProductSuccessState({required this.productResponse});
}

class AddCartLoadingState extends ProductStates {}

class AddCartErrorState extends ProductStates {
  Failures failures;
  AddCartErrorState({required this.failures});
}

class AddCartSuccessState extends ProductStates {
  AddCartResponse productResponse;
  AddCartSuccessState({required this.productResponse});
}
