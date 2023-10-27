import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/button.dart';
import 'package:flutter_application_2/components/food_tile.dart';
import 'package:flutter_application_2/pages/food_details_page.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // navigate to food item details pages
  void navigateToFoodDetails(int index) {
    final foodMenu = Provider.of<Shop>(context, listen: false).foodMenu;
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => FoodDetailsPage(
                  food: foodMenu[index],
                )));
  }

  @override
  Widget build(BuildContext context) {
    final foodMenu = Provider.of<Shop>(context, listen: false).foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        foregroundColor: Colors.grey[900],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.menu,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/cartpage');
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
        title: const Text(
          "Tokyo"),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // promo banner
        Container(
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.symmetric(horizontal: 25),
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // promo message
                  Text(
                    "Get 32% Promo",
                    style: GoogleFonts.dmSerifDisplay(
                        color: Colors.white, fontSize: 20),
                  ),

                  const SizedBox(height: 20),

                  // redeem button
                  MyButton(text: "Redeem", onTap: () {})
                ],
              ),

              // Image
              Image.asset(
                'lib/images/many_sushi.png',
                width: 100,
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),
        // search bar

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: TextField(
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                hintText: "Search here..."),
          ),
        ),

        const SizedBox(height: 25),

        // menu list
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "Food Menu",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900]),
            )),

        const SizedBox(height: 10),

        Expanded(
            child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => FoodTile(
            food: foodMenu[index],
            onTap: () {
              navigateToFoodDetails(index);
            },
          ),
          itemCount: foodMenu.length,
        )),

        const SizedBox(height: 25),

        // popular food
        Container(
          decoration: BoxDecoration(
              color: Colors.grey[100], borderRadius: BorderRadius.circular(20)),
          margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
          padding: const EdgeInsets.all(20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            // image
            Row(
              children: [
                Image.asset(
                  'lib/images/salmon_eggs.png',
                  height: 60,
                ),

                const SizedBox(width: 20),

                // name and price
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Text(
                      "Salmon Eggs",
                      style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                    ),
                    // price
                    const SizedBox(height: 10),
                    Text(
                      "\$ 21.00",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ],
            ),

            const Icon(Icons.favorite_outline, color: Colors.grey, size: 30)
          ]),
        )
      ]),
    );
  }
}
