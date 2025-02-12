import 'package:flutter/material.dart';

class CurrentCarrouselIndex extends ChangeNotifier {
  int currentIndex = 0;

  void add() {
    currentIndex++;
    notifyListeners();
  }

  void set(int value) {
    currentIndex = value;
    notifyListeners();
  }

  void reset() {
    currentIndex = 0;
    notifyListeners();
  }
}
