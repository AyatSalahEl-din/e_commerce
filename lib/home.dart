import 'package:e_commerce/app_colors.dart';
import 'package:e_commerce/auth/custom_text_form_field.dart';
import 'package:e_commerce/favourite.dart';
import 'package:e_commerce/home_page.dart';
import 'package:e_commerce/productList.dart';
import 'package:e_commerce/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  int selectedIndex = 0;
  final List<Widget> _pages = [
    HomePageWidget(), // A new widget for the home tab content
    ProductList(),
    FavouriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[selectedIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          itemCount: 4,
          tabBuilder: (int index, bool isActive) {
            final color =
                isActive ? AppColors.whiteColor : AppColors.whiteColor;
            IconData iconData;
            switch (index) {
              case 0:
                iconData = Icons.home;
                break;
              case 1:
                iconData = Icons.category;
                break;
              case 2:
                iconData = Icons.favorite;
                break;
              case 3:
                iconData = Icons.person;
                break;
              default:
                iconData = Icons.home;
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconData,
                  size: 22,
                  color: color,
                ),
              ],
            );
          },
          backgroundColor: AppColors.primaryColor,
          activeIndex: selectedIndex,
          splashColor: AppColors.whiteColor,
          notchSmoothness: NotchSmoothness.smoothEdge,
          gapLocation: GapLocation.center,
          leftCornerRadius: 32,
          rightCornerRadius: 32,
          gapWidth: MediaQuery.of(context).size.width * 0.01,
          onTap: (index) {
            setState(() => selectedIndex = index);
          }),
    );
  }
}
