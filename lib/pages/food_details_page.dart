import 'package:flutter/material.dart';
import 'package:flutter_application_2/components/button.dart';
import 'package:flutter_application_2/models/food.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  // quantity
  int quantityCount = 0;
  // decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCount != 0) {
        quantityCount --;
      }
    });
  }
  // increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCount ++;
    });
  }

  // add to cart
  void addToCart() {
    // only add to cart if there sth in the cart
    if (quantityCount>0) {
      // get access to shop
      final shop = context.read<Shop>();
      // add to cart
      shop.addToCart(widget.food, quantityCount);
      // let the user know it was successful
      showDialog(
        barrierDismissible: false,
        // 这一行代码意在阻止用户点击dialog外部，dialog消失
        context: context, 
        builder: (context)=>AlertDialog(
          backgroundColor: primaryColor,
          content: const Text("Successfully added to cart!",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,),
          actions: [
            // okay button
            IconButton(onPressed: (){
              // pop once to remove dialog box 
              Navigator.pop(context);
              // pop again to go previous screen
              Navigator.pop(context);
            },
            icon: const Icon(Icons.done, color: Colors.white,))
          ],
      ));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.grey[900],
        ),
      ),
      body: Column(
        children: [
          // listview of food details
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ListView(
              children: [
                // image
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),

                const SizedBox(
                  height: 25,
                ),

                // rating
                Row(
                  children: [
                    // star icon
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                      size: 20,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    // rating number
                    Text(
                      widget.food.rating,
                      style: TextStyle(
                          color: Colors.grey[600], fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 10,
                ),
                // food name
                Text(widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 28)),
                
                const SizedBox(height: 25,),
                // description
                Text("Description", style: TextStyle(
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),),

                const SizedBox(height: 10,),

                Text("Delicate sliced, fresh salmon drapes elegantly over a pillow of perfectly seasoned sushi rice, creating a harmonious symphony of flavors and textures. The vibrant orange hue of the salmon contrasts beautifully with the pristine white rice, inviting you to indulge in its visual allure.Each bite reveals a delightful combination of buttery smoothness from the salmon and the subtle tanginess of the rice, creating a culinary masterpiece that dances on your palate.",
                  style: TextStyle(color: Colors.grey[600],
                  fontSize: 14, height: 2),
                ),

                const SizedBox(height: 30,)
              ],
            ),
          )),

          // price + quality + add to cart button
          Container(
            // 左上角右上角圆角
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              )
            ),
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
              // price + quantity
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // price
                   Text("\$${widget.food.price}",
                    style: const TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),

                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle
                        ),
                        child: IconButton(
                          onPressed: decrementQuantity,
                          icon: const Icon(Icons.remove),
                          color: Colors.white,
                        ),
                      ),

                      SizedBox(
                        width: 40,
                        child: Center(
                          child: Text(quantityCount.toString(),
                            style: const TextStyle(
                              color:Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          shape: BoxShape.circle
                        ),
                        child: IconButton(
                          onPressed: incrementQuantity,
                          icon: const Icon(Icons.add),
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                  // quantity 
                ],
              ),
              
              const SizedBox(height: 25,),

              // add to cart button

              MyButton(text: "Add To Cart", onTap: addToCart)

            ]),
          )
        ],
      ),
    );
  }
}
