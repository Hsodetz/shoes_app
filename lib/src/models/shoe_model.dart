
import 'package:flutter/material.dart';

class ShoeModel with ChangeNotifier {
  
  String _assetImage = "assets/imgs/azul.png";
  double _tail = 9.0;

  String get assetImage => _assetImage;
  double get tail => _tail;

  set assetImage(String value) {
    _assetImage = value;
    notifyListeners();
  }

  set tail(double value) {
    _tail = value;
    notifyListeners();
  }

}