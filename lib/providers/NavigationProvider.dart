import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class NavigationProvider with ChangeNotifier {
  int _currentIndex = 3;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}