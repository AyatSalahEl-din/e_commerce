import 'package:e_commerce/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatelessWidget {
  static const String routeName = 'home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Positioned(
                left: 20,
                child: Image.asset('assets/images/logoda.png'),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      style: TextStyle(color: AppColors.primaryColor),
                      decoration: InputDecoration(
                        labelText: 'what do you search for?',
                        labelStyle: GoogleFonts.poppins(
                          fontSize: 18,
                          color: AppColors.textColor,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(color: AppColors.primaryColor)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide:
                                BorderSide(color: AppColors.primaryColor)),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.primaryColor,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.shopping_cart,
                    color: AppColors.primaryColor,
                    size: 30,
                  ),
                ],
              ),
              //////////////////////////////////////////////////////
              SizedBox(height: 20),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/hphones.png',
                          ),
                        ),
                        Positioned(
                          child: Image.asset(
                            'assets/images/text.png',
                          ),
                          top: 10,
                          left: 10,
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Stack(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/hphones.png',
                          ),
                        ),
                        Positioned(
                          child: Image.asset(
                            'assets/images/text.png',
                          ),
                          top: 10,
                          left: 10,
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Stack(
                      children: [
                        Container(
                          child: Image.asset(
                            'assets/images/hphones.png',
                          ),
                        ),
                        Positioned(
                          child: Image.asset(
                            'assets/images/text.png',
                          ),
                          top: 10,
                          left: 10,
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
              SizedBox(height: 20),
              //////////////////////////////////////////////////////
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'view all',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.textColor,
                        ),
                      ))
                ],
              ),

              Container(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/images/women.png'),
                    Image.asset('assets/images/men.png'),
                    Image.asset('assets/images/laptop.png'),
                    Image.asset('assets/images/baby.png'),
                  ],
                ),
              ),
              Container(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/images/beautyy.png'),
                    Image.asset('assets/images/headph.png'),
                    Image.asset('assets/images/skincare.png'),
                    Image.asset('assets/images/camera.png'),
                  ],
                ),
              ),
              Text(
                'Home Appliance',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/images/Frame 13.png'),
                    SizedBox(width: 20),
                    Image.asset('assets/images/Frame 14.png'),
                    SizedBox(width: 20),
                    Image.asset('assets/images/Frame 15.png'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
