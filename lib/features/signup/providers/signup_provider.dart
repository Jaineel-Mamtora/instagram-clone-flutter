import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  bool _obscure = true;

  bool get obscure => _obscure;
  set setObscure(bool value) {
    _obscure = value;
    notifyListeners();
  }
}
