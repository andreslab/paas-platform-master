import 'package:flutter/material.dart';

class HomeBar with ChangeNotifier {
  int _indexPage = 0;

  get indexPage {
    return _indexPage;
  }

  set indexPage(int i) {
    this._indexPage = i;
    notifyListeners();
  }
}