import 'package:e_commerce/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryBrandItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //todo : category or brand model
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/women.png'),
            radius: 50.r,
          ),
        ),
        SizedBox(height: 8.h),
        Expanded(
            flex: 2,
            child: Text(
              "name",
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ))
      ],
    );
  }
}
