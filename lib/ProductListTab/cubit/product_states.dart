import 'package:e_commerce/data/model/Response/ProductResponse.dart';

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
