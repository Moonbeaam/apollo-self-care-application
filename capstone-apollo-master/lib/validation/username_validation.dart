import 'package:apolloApp/validation/validation_item.dart';
import 'package:flutter/material.dart';
import '../introScreen.dart';

class UsernameValidation with ChangeNotifier {
  ValidationItem _userName = ValidationItem(null, null);

  //Getters
  ValidationItem get userName => _userName;
  bool get isValid {
    if (_userName.value != null) {
      return true;
    } else {
      return false;
    }
  }

  //Setters
  void changeUserName(String value) {
    if (value.isEmpty) {
      _userName = ValidationItem(value, null);
    } else {
      _userName = ValidationItem(null, "Must not be empty");
    }
    notifyListeners();
  }
}
