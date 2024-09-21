import 'package:e_commerce/HomeScreen/HomeTab/widgets/announcements_section.dart';
import 'package:e_commerce/HomeScreen/HomeTab/widgets/categories_brands_widgets.dart';
import 'package:e_commerce/HomeScreen/HomeTab/widgets/row_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app_colors.dart';
import 'cubit/home_tab_cubit.dart';
import 'cubit/home_tab_state.dart';

class HomePageWidget extends StatelessWidget {
  static const String routeName = 'home_page';
  HomeTabCubit cubit = HomeTabCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabStates>(
        bloc: cubit
          ..getAllCategories()
          ..getAllBrands(),
        builder: (context, state) {
          return SafeArea(
            // backgroundColor: AppColors.whiteColor,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 17.w,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Positioned(
                      left: 20,
                      child: Image.asset('assets/images/logoda.png'),
                    ),
                    SizedBox(height: 20),
                    //search
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(color: AppColors.primaryColor),
                            decoration: InputDecoration(
                              labelText: 'what do you search for?',
                              labelStyle: GoogleFonts.poppins(
                                fontSize: 18,
                                color: AppColors.textColor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      color: AppColors.primaryColor)),
                              prefixIcon: Icon(
                                Icons.search,
                                color: AppColors.primaryColor,
                                size: 35,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.shopping_cart,
                          color: AppColors.primaryColor,
                          size: 30,
                        ),
                      ],
                    ),
                    //////////////////////////////////////////////////////
                    SizedBox(height: 16.h),
                    AnnouncementsSection(),
                    SizedBox(height: 16.h),
                    //////////////////////////////////////////////////////
                    RowSectionWidget(name: 'Categories'),
                    SizedBox(height: 24.h),

                    /*cubit.categoriesList!.isEmpty?
                  Center(
                    child: 
                    CircularProgressIndicator(
                      color: AppColors.primaryColor,),):
                  CategoriesBrandsWidget(),*/
                    //another way:

                    state is HomeTabLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : state is HomeTabErrorState
                            ? Center(
                                child: Text(
                                    textWidthBasis: TextWidthBasis.longestLine,
                                    state.errorMessage,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryColor,
                                    )))
                            : CategoriesBrandsWidget(
                                list: cubit.categoriesList!),

                    SizedBox(height: 24.h),

                    //to handle scenarios : 3rd way of future

                    /* FutureBuilder<CategoreyResponse>(
                future: ApiManager.getAllCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child:
                          CircularProgressIndicator(color: AppColors.primaryColor),
                    );
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        Text('Something went wrong'),
                        ElevatedButton(
                          onPressed: () {
                            ApiManager.getAllCategories();
                            setState(() {
                              
                            });
                          },
                          child: Text('Try again'),
                        )
                      ],
                    );
                  }
        
                  //server => response (error , success)
                  if (snapshot.data!.statusMsg == 'fail') {
                    return Column(
                      children: [
                        Text(snapshot.data!.message!),
                        ElevatedButton(
                          onPressed: () {
                            ApiManager.getAllCategories();
                            setState(() {
                              
                            });
                          },
                          child: Text('Try again'),
                        )
                      ],
                    );
                  }
                  var categoriesList = snapshot.data!.data;
                  return ListView.builder(
                      itemBuilder: (context, index) {
                        return Text(categoriesList[index].name ?? '');
                      },
                      itemCount: categoriesList!.length);
                })*/

                    RowSectionWidget(name: 'Brands'),
                    SizedBox(height: 24.h),

                    state is HomeBrandsLoadingState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          )
                        : state is HomeBrandsErrorState
                            ? Center(
                                child: Text(
                                    textWidthBasis: TextWidthBasis.longestLine,
                                    state.errorMessage,
                                    style: GoogleFonts.poppins(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryColor,
                                    )))
                            : state is HomeBrandsSuccessState
                                ? CategoriesBrandsWidget(
                                    list: cubit.brandsList!)
                                : const SizedBox.shrink()
                  ],
                ),
              ),
            ),
          );
        });
  }
}
