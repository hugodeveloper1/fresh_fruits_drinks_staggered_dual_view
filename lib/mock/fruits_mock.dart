import 'dart:math';

import 'package:fresh_fruits_drinks_staggered_dual_view/models/fruit_model.dart';

class FruitsMock {
  static List<FruitModel> get fruits {
    List<FruitModel> list = [];
    List<String> assets = [
      'avocado',
      'kiwi',
      'mango',
      'orange',
      'pineapple',
      'strawberry',
    ];

    for (var asset in assets) {
      list.add(
        FruitModel(
          image: 'assets/$asset.png',
          name: asset,
          price: _priceRandom,
        ),
      );
    }

    return list;
  }

  static double get _priceRandom {
    Random random = Random();
    double precioAleatorio = 4.0 + (random.nextDouble() * (10.0 - 4.0));
    return double.parse(precioAleatorio.toStringAsFixed(2));
  }
}
