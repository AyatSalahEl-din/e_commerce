import 'package:e_commerce/ProductListTab/cubit/product_cubit.dart';
import 'package:e_commerce/ProductListTab/productList.dart';
import 'package:e_commerce/auth/login/login.dart';
import 'package:e_commerce/auth/register/register.dart';
import 'package:e_commerce/favourite.dart';
import 'package:e_commerce/HomeScreen/home.dart';
import 'package:e_commerce/my_bloc_observer.dart';
import 'package:e_commerce/profile.dart';
import 'package:e_commerce/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.routeName,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              ProductList.routeName: (context) => ProductList(),
              ProfileScreen.routeName: (context) => ProfileScreen(),
              FavouriteScreen.routeName: (context) => FavouriteScreen(),
            },
          );
        });
  }
}
