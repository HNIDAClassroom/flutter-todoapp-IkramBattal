
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class ColorModel with ChangeNotifier {

  Color backgroundColor;

  ColorModel({this.backgroundColor = Colors.white});

  void changeBackgroundColor(Color bgColor) {
    backgroundColor = bgColor;
    notifyListeners();
  }
}
