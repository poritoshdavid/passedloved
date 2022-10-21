import 'package:flutter/material.dart';

class Person extends ChangeNotifier {
  Person({required this.okNotifier});
  bool okNotifier;

  void boolTrue() {
    okNotifier = true;
    notifyListeners();
  }

  void boolFalse() {
    okNotifier = false;
    notifyListeners();
  }
}
