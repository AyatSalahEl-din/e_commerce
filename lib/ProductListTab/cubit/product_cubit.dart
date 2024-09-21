
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api_manager.dart';
import '../../data/model/Response/ProductResponse.dart';
import 'product_states.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  //todo : hold data - handle logic
  List<Product>? productList;
  int numOfCartItem = 0;

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

  static ProductCubit get(context) => BlocProvider.of(context);

  void addToCart(String productId) async {
    emit(AddCartLoadingState());
    var either = await ApiManager.addToCart(productId);
    either.fold((error) => emit(AddCartErrorState(failures: error)),
        (response) {
      numOfCartItem = response.numOfCartItems!.toInt();
      print("number of cart item :$numOfCartItem");
      emit(AddCartSuccessState(productResponse: response));
    });
  }
}
