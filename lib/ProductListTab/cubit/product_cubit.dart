import 'package:e_commerce/ProductListTab/cubit/product_states.dart';
import 'package:e_commerce/data/api_manager.dart';
import 'package:e_commerce/data/model/Response/ProductResponse.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  //todo : hold data - handle logic
  List<Product>? productList;

  void getAllProducts() async {
    try {
      emit(ProductLoadingState());
      var response = await ApiManager.getAllProducts();
      if (response.statusMsg == 'fail') {
        emit(ProductErrorState(errorMessage: response.message!));
      } else {
        productList = response.data ?? [];
        emit(ProductSuccessState(productResponse: response));
      }
    } catch (e) {
      emit(ProductErrorState(errorMessage: e.toString()));
    }
  }
}
