import 'package:flutter/material.dart';

class TemplateBar with ChangeNotifier {
  int _indexPage = 0;

  get indexPage {
    return _indexPage;
  }

  set indexPage(int i) {
    this._indexPage = i;
    notifyListeners();
  }
}