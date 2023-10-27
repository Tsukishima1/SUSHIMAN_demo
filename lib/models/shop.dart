import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier {
  // food menu
  final List<Food> _foodMenu = [
    // salmon sushi
    Food(
        name: "Salmon Sushi",
        price: "21.00",
        imagePath: "lib/images/salmon_sushi.png",
        rating: "4.9"),
    // tuna
    Food(
        name: "Tuna",
        price: "23.00",
        imagePath: "lib/images/tuna.png",
        rating: "4.3"),
  ];

  // customer cut 
  // ignore: prefer_final_fields
  List <Food> _cart = [];
  // 这一句意在声明一个私有变量，只能在类内部使用，外部无法访问
  // 但是在Dart中，没有真正的私有变量，只是通过下划线来约定俗成的表示私有变量

  // getter
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
  // 这两行代码意在声明两个getter，用于获取私有变量_foodMenu和_cart

  // add food to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}