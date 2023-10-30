import 'package:flutter/material.dart';
import 'package:flutter_application_2/theme/colors.dart';
import 'package:provider/provider.dart';

import '../components/button.dart';
import '../models/food.dart';
import '../models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                elevation: 0,
                centerTitle: true,
                foregroundColor: Colors.white,
                backgroundColor: primaryColor,
                title: const Text("My Cart"),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(itemBuilder: (context, index) {
                      if (index >= value.cart.length) {
                        return null; // 或者返回一个空的占位符 Widget
                      }
                      // get food from cart
                      final Food food = value.cart[index];
                      // 这里的value是Consumer的builder的第一个参数，即Shop
                      // 因为我们在main.dart中使用了ChangeNotifierProvider<Shop>
                      // 所以这里的value就是Shop的实例
                      // 通过value.cart[index]就可以获取到购物车中的食物
                      // get food name
                      final String foodName = food.name;
                      // get food price
                      final String foodPrice = food.price;
                      // return list tile
                      return Container(
                        margin: const EdgeInsets.only(left:20, top:20, right:20),
                        decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(8),),
                        child: ListTile(
                          leading: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(food.imagePath, width: 30),
                            ],
                          ),
                          title: Text(foodName, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                          subtitle: Text("\$ $foodPrice", style: TextStyle(color: Colors.grey[300]),),
                          trailing: IconButton(
                            onPressed: () {
                              // remove from cart
                              value.removeFromCart(food);
                            },
                            icon: Icon(Icons.delete, color: Colors.grey[300],),
                          ),
                        ),
                      );
                    }),
                  ),
                  // PAY BUTTON 
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: MyButton(text: "Pay Now", onTap: (){}),
                  )
                ],
              ),
            ));
  }
}
