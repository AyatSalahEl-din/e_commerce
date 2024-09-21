
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

import '../app_colors.dart';
import 'cubit/home_sceen_states.dart';
import 'cubit/home_screen_cubit.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  HomeScreenCubit cubit = HomeScreenCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenStates>(
        bloc: cubit,
        builder: (context, state) {
          return Scaffold(
            body: cubit.tabs[cubit.selectedIndex],
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
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
                activeIndex: cubit.selectedIndex,
                splashColor: AppColors.whiteColor,
                notchSmoothness: NotchSmoothness.smoothEdge,
                gapLocation: GapLocation.center,
                leftCornerRadius: 32,
                rightCornerRadius: 32,
                gapWidth: MediaQuery.of(context).size.width * 0.01,
                onTap: (index) {
                  cubit.changeSelectedIndex(index);
                }),
          );
        });
  }
}
