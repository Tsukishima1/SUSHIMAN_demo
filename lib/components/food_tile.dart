import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/food.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsets.only(left: 25),
        padding: const EdgeInsets.all(25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
          // image
          Image.asset(
            food.imagePath,
            height: 140,
          ),
          // text
          Text(
            food.name,
            style: GoogleFonts.dmSerifDisplay(fontSize: 20),
          ),
          // price + rating
          SizedBox(
            width: 160,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // price
                Text('\$${food.price}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700])
                ),
    
                // _rating
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                      size: 20,
                    ),
                    Text(food.rating, style: TextStyle(color: Colors.grey[600]),),
                  ],
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
