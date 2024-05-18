import 'package:flutter/material.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/mock/fruits_mock.dart';
import 'package:fresh_fruits_drinks_staggered_dual_view/models/fruit_model.dart';

class HomeController extends ChangeNotifier {
  List<FruitModel> _fruits = [];
  List<FruitModel> get fruits => _fruits;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void getFruits() async {
    await Future.delayed(const Duration(seconds: 2));
    _fruits = FruitsMock.fruits;
    _isLoading = true;
    notifyListeners();
  }
}
