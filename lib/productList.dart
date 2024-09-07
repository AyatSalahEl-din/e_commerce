import 'package:e_commerce/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductList extends StatelessWidget {
  static const String routeName = 'product_list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: Image.asset('assets/images/logoda.png'),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: AppColors.primaryColor),
                    decoration: InputDecoration(
                      labelText: 'What do you search for?',
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 18,
                        color: AppColors.textColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
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
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8, // Adjusts the height of the cards
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ProductCard();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  'assets/images/shoes.jpg',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Nike Air Jordan',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  'Nike shoes flexible for workout',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'EGP 1,200',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                          ),
                        ),
                        Text(
                          '2,000 EGP',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Row(
                          children: [
                            Text('Reviews (4.8)',
                                style: TextStyle(
                                  color: AppColors.textColor,
                                )),
                            Icon(Icons.star, color: Colors.amber, size: 16),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 8,
            right: 8,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(Icons.favorite_border, color: AppColors.redColor),
                onPressed: () {},
              ),
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: IconButton(
                icon: Icon(Icons.add, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
