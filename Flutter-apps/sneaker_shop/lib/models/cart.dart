import 'package:flutter/material.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  List<Shoe> shoeShop = [
    Shoe(
        description: "The radiance lives on with the b-ball original",
        path: 'lib/images/shoe1.webp',
        price: "9695.00",
        shoeName: "Air Force 1 '07"),
    Shoe(
        description: "Mercurial-inspired design",
        path: 'lib/images/mercurial.webp',
        price: "18395.00",
        shoeName: "Mercurial 25"),
    Shoe(
        description: "The classic AJ1",
        path: 'lib/images/retro.webp',
        price: "16995.00",
        shoeName: "Jordan 1 Retro "),
    Shoe(
        description: "A balanced and energised ride",
        path: 'lib/images/runner.webp',
        price: " 10495.00",
        shoeName: " Pegasus FlyEase"),
  ];

  List<Shoe> userCartShoes = [];

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  List<Shoe> getCartItems() {
    return userCartShoes;
  }

  void addToCart(Shoe shoe) {
    userCartShoes.add(shoe);
    notifyListeners();
  }

  void removeFromCart(Shoe shoe) {
    userCartShoes.remove(shoe);
    notifyListeners();
  }
}
