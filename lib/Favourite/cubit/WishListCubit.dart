
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api_manager.dart';
import '../../data/model/Response/GetWishListResponse.dart';
import 'WishListStates.dart';

class WishListCubit extends Cubit<WishListStates> {
  WishListCubit() : super(WishListInitialState());
  //todo: hold data - handle logic
  List<GetWishlistData> wishList = [];

  static WishListCubit get(context) => BlocProvider.of(context);

  void getWishlistItems() async {
    emit(WishlistLoadingState());
    var either = await ApiManager.getWishList();
    either.fold((failures) => emit((WishlistErrorState(failures: failures))),
        (response) {
      wishList = response.data!;
      emit(WishListSuccuessState(response: response));
    });
  }

  void addToWishlist(String productId) async {
    var either = await ApiManager.addItemToWishList(productId);
    either.fold((failure) => emit(AddToWishlistErrorState(failures: failure)),
        (response) {
      emit(AddToWishlistSuccuessState(response: response));
    });
  }

  void deleteItemFromWishlist(String productId) async {
    emit(DeleteFromWishlistLoadingState());

    var either = await ApiManager.deleteItemFromWishList(productId);
    either.fold(
        (failure) => emit(DeleteFromWishlistErrorState(failures: failure)),
        (response) {
      emit(WishListSuccuessState(response: response));
    });
  }
}
