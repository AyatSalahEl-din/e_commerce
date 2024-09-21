import 'package:e_commerce/ProductListTab/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';
import '../cart/cart_screen.dart';
import 'ProductDetails.dart';
import 'cubit/product_cubit.dart';
import 'cubit/product_states.dart';

class ProductList extends StatelessWidget {
  static const String routeName = 'product_list';
  ProductCubit cubit = ProductCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => cubit..getAllProducts(),
        child:
            BlocBuilder<ProductCubit, ProductStates>(builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.whiteColor,
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(CartScreen.routeName);
                      },
                      child: Badge(
                        label: Text(cubit.numOfCartItem.toString()),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 28.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              /////////////////////
              state is ProductSuccessState || state is AddCartSuccessState
                  ? Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio:
                                  2 / 2.4, // Adjusts the height of the cards
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 16.h,
                            ),
                            itemCount: cubit.productList!.length ?? 0,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  splashColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        ProductDetails.routeName,
                                        arguments: cubit.productList![index]);
                                  },
                                  child: ProductCard(
                                    product: cubit.productList![index],
                                  ));
                            },
                          )))
                  : Center(
                      child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )),
            ]),
          );
        }));
  }
}
