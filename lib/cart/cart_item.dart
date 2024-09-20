import 'package:e_commerce/ProductListTab/cubit/product_cubit.dart';
import 'package:e_commerce/app_colors.dart';
import 'package:e_commerce/cart/cubit/cart_screen_cubit.dart';
import 'package:e_commerce/data/model/Response/GetCartResponse.dart';
import 'package:e_commerce/data/model/Response/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CartItem extends StatelessWidget {
  GetProductCart productCart;
  CartItem({required this.productCart});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h, bottom: 24.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          border: Border.all(width: 1.w, color: AppColors.primaryColor),
        ),
        width: 398.w,
        height: 145.h,
        child: Row(children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 145.h,
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Image.network(productCart.product?.imageCover ?? ''),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productCart.product?.title ?? '',
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          //todo delete item in cart
                          CartScreenCubit.get(context)
                              .deleteItemInCart(productCart.product?.id ?? "");
                        },
                        child: Icon(Icons.delete_outline,
                            color: AppColors.primaryColor),
                      )
                    ],
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.only(bottom: 14.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'EGP ${productCart.price}',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(100.r)),
                        child: Row(children: [
                          Padding(
                            padding: EdgeInsets.zero,
                            child: IconButton(
                              onPressed: () {
                                //decrement count
                                int count = productCart.count!.toInt();
                                count--;
                                CartScreenCubit.get(context).updateCountInCart(
                                  productCart.product?.id ?? '',
                                  count,
                                );
                              },
                              icon: Icon(
                                Icons.remove_circle_outline,
                                color: AppColors.whiteColor,
                                size: 28.sp,
                              ),
                            ),
                          ),
                          Text(
                            '${productCart.count}',
                            style: GoogleFonts.poppins(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.zero,
                            child: IconButton(
                              onPressed: () {
                                //increment count
                                int count = productCart.count!.toInt();
                                count++;
                                CartScreenCubit.get(context).updateCountInCart(
                                  productCart.product?.id ?? '',
                                  count,
                                );
                              },
                              icon: Icon(
                                Icons.add_circle_outline,
                                color: AppColors.whiteColor,
                                size: 28.sp,
                              ),
                            ),
                          ),
                        ]),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
