import 'package:e_commerce/app_colors.dart';
import 'package:e_commerce/data/model/Response/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCard extends StatelessWidget {
  Product product;
  bool isWishlisted = false;
  ProductCard({required this.product});
  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Image.network(
                  product.imageCover ?? '',
                  height: 128.h,
                  width: 191.w,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 5.h,
                right: 2.w,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 15,
                  child: IconButton(
                    color: AppColors.primaryColor,
                    padding: EdgeInsets.zero,
                    icon: isWishlisted == true
                        ? const Icon(Icons.favorite_rounded)
                        : const Icon(Icons.favorite_border_rounded),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              product.title ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Text(
                  'EGP ${product.price}',
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 7.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Row(
              children: [
                Text(
                  'Reviews ${product.ratingsAverage} ',
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Icon(Icons.star, color: Colors.amber, size: 16),
                const Spacer(
                  flex: 1,
                ),
                InkWell(
                  onTap: () {
                    //add to cart
                  },
                  splashColor: Colors.transparent,
                  child: Icon(
                    Icons.add_circle,
                    size: 32.sp,
                    color: AppColors.primaryColor,
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
