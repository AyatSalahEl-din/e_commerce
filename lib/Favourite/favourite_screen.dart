
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import 'cubit/WishListCubit.dart';
import 'cubit/WishListStates.dart';
import 'favourite_item.dart';

class FavouriteScreen extends StatelessWidget {
  static const String routeName = 'favourite_screen';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListCubit, WishListStates>(
        bloc: WishListCubit()..getWishlistItems(),
        builder: (context, state) {
          return Scaffold(
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Image.asset('assets/images/logoda.png'),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: AppColors.primaryColor),
                          decoration: InputDecoration(
                            labelText: 'What do you search for?',
                            labelStyle: GoogleFonts.poppins(
                              fontSize: 18,
                              color: AppColors.textColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide:
                                  BorderSide(color: AppColors.primaryColor),
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: AppColors.primaryColor,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                /////
                state is WishListSuccuessState
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: state.response.data!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return FavouriteItem(
                                wishList: state.response.data![index],
                              );
                            }),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
              ]));
        });
  }
}
