import 'package:e_commerce/HomeScreen/HomeTab/home_page.dart';
import 'package:e_commerce/HomeScreen/cubit/home_sceen_states.dart';
import 'package:e_commerce/ProductListTab/productList.dart';
import 'package:e_commerce/favourite.dart';
import 'package:e_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//m3ndho4 constructor ya5od mno parameter f hanady 3la super
class HomeScreenCubit extends Cubit<HomeScreenStates> {
  HomeScreenCubit() : super(HomeScreenInitialState());
  //todo hold data and handle data
  TextEditingController searchController = TextEditingController();

  int selectedIndex = 0;
  final List<Widget> tabs = [
    HomePageWidget(), // A new widget for the home tab content
    ProductList(),
    FavouriteScreen(),
    ProfileScreen(),
  ];
  void changeSelectedIndex(int newIndex) {
    emit(HomeScreenInitialState());
    selectedIndex = newIndex;
    emit(ChangeSelectedIndexState());
  }
}
