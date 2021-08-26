import 'package:flutter/cupertino.dart';

class ModelHUd extends ChangeNotifier {
  bool isLoading = false;
  changeisLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
