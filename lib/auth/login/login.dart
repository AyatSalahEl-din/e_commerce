import 'package:e_commerce/app_colors.dart';
import 'package:e_commerce/auth/custom_text_form_field.dart';
import 'package:e_commerce/auth/login/cubit/login_cubit.dart';
import 'package:e_commerce/auth/login/cubit/login_states.dart';
import 'package:e_commerce/auth/register/register.dart';
import 'package:e_commerce/dialog_utils.dart';
import 'package:e_commerce/HomeScreen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit cubit = LoginCubit();

  /* TextEditingController emailController = TextEditingController(text: 'ayat@gmail.com');

  TextEditingController passController = TextEditingController(text: '123456');

  bool passwordVisible = false;

  var formKey = GlobalKey<FormState>();*/

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      bloc: cubit,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(
            context: context,
            loadingLabel: 'Waiting',
          );
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: state.errorMessage,
            title: 'Error',
            posActionName: 'OK',
          );
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context);
          DialogUtils.showMessage(
            context: context,
            content: 'Login Successfully.',
            title: 'Success',
            posActionName: 'OK',
          );
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: cubit.formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/images/logoo.png',
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Welcome Back to Route",
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    Text(
                      "Please sign in with your mail",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Email",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    CustomTextFormField(
                      label: 'enter your email',
                      controller: cubit.emailController,
                      validator: (text) {
                        ////trim bt filter spaces 2bl w b3d
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Password",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    CustomTextFormField(
                      label: 'enter your password',
                      controller: cubit.passController,
                      validator: (text) {
                        ////trim bt filter spaces 2bl w b3d
                        if (text == null || text.trim().isEmpty) {
                          return 'Please Enter Password.';
                        }
                        if (text.length < 6) {
                          return 'Password must be at least 6 Characters.';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone, //>> numbers & letter
                      //keyboardType: TextInputType.number, //numbers only
                      obscureText:
                          !cubit.passwordVisible, //to make it unseen first
                      suffixIcon: IconButton(
                        icon: Icon(
                          cubit.passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            cubit.passwordVisible = !cubit.passwordVisible;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forgot password?",
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        cubit.login();
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(398, 64),
                        backgroundColor: AppColors.whiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(RegisterScreen.routeName);
                      },
                      child: Text(
                        "Don't have an account? Create Account",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
