import 'package:e_commerce/HomeScreen/HomeTab/widgets/category_brand_item.dart';
import 'package:e_commerce/data/model/Response/CategoreyOrBrandResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesBrandsWidget extends StatelessWidget {
  List<CategoryOrBrand> list;
  CategoriesBrandsWidget({required this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200.h,
        child: GridView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 16, crossAxisSpacing: 16),
          itemBuilder: (context, index) {
            return CategoryBrandItem(
              categoryOrBrand: list[index],
            );
          },
        ));
  }
}
