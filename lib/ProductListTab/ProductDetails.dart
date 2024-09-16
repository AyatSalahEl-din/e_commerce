import 'package:e_commerce/app_colors.dart';
import 'package:e_commerce/data/model/Response/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class ProductDetails extends StatelessWidget {
  static const String routeName = 'product_deatils';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        title: const Text("Product details"),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primaryColor,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColor,
        ),
        actions: [
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.search)),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(Icons.shopping_cart_outlined))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.grey, width: 2.w)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: ImageSlideshow(
                    initialPage: 0,
                    indicatorColor: AppColors.primaryColor,
                    indicatorBackgroundColor: AppColors.whiteColor,
                    indicatorBottomPadding: 20.h,
                    autoPlayInterval: 3000,
                    isLoop: true,
                    children: args.images!
                        .map(
                          (url) => Image.network(
                            url,
                            fit: BoxFit.cover,
                            height: 300.h,
                            width: double.infinity,
                          ),
                        )
                        .toList()),
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    args.title ?? '',
                    style: GoogleFonts.poppins(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ),
                Text(
                  'EGP ${args.price}',
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        border:
                            Border.all(color: AppColors.primaryColor, width: 1),
                      ),
                      child: Text(
                        "Sold : ${args.sold}",
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Icon(Icons.star, color: Colors.amber, size: 18.sp),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "${args.ratingsAverage}",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    ),
                  ],
                )),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.remove_circle_outline_rounded,
                          color: AppColors.whiteColor,
                          size: 28.sp,
                        ),
                      ),
                      Text(
                        '1',
                        style: GoogleFonts.poppins(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle_outline_rounded,
                          color: AppColors.whiteColor,
                          size: 28.sp,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Text(
              'Description',
              style: GoogleFonts.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            ReadMoreText(
              args.description ?? '',
              trimMode: TrimMode.Line,
              trimLines: 2,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                color: AppColors.textColor.withOpacity(0.6),
              ),
              trimCollapsedText: 'Show More',
              trimExpandedText: 'Show Less',
              moreStyle: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
              lessStyle: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            SizedBox(
              height: 120.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      'Total Price',
                      style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      "EGP ${args.price}",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 32.w,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.r))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(Icons.add_shopping_cart_outlined),
                        Text(
                          "Add to cart",
                          style: GoogleFonts.poppins(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
