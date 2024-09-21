import 'package:e_commerce/ProductListTab/cubit/product_cubit.dart';
import 'package:e_commerce/my_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Favourite/cubit/WishListCubit.dart';
import 'Favourite/favourite_screen.dart';
import 'HomeScreen/home.dart';
import 'ProductListTab/ProductDetails.dart';
import 'ProductListTab/productList.dart';
import 'auth/login/login.dart';
import 'auth/register/register.dart';
import 'cart/cart_screen.dart';
import 'cart/cubit/cart_screen_cubit.dart';
import 'profile.dart';
import 'splash_screen.dart';
import 'utils/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await SharedPreferencesUtils.init();
  var token = SharedPreferencesUtils.getData(key: 'token');
  String route;
  if (token == null) {
    route = LoginScreen.routeName;
  } else {
    route = HomeScreen.routeName;
  }

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => CartScreenCubit()),
      BlocProvider(
        create: (context) => WishListCubit(),
      ),
      BlocProvider(create: (context) => ProductCubit())
    ],
    child: MyApp(route: route),
  ));
}

class MyApp extends StatelessWidget {
  String route;
  MyApp({required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: route,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              HomeScreen.routeName: (context) => HomeScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              ProductList.routeName: (context) => ProductList(),
              ProductDetails.routeName: (context) => ProductDetails(),
              ProfileScreen.routeName: (context) => ProfileScreen(),
              FavouriteScreen.routeName: (context) => FavouriteScreen(),
              CartScreen.routeName: (context) => CartScreen(),
            },
          );
        });
  }
}
