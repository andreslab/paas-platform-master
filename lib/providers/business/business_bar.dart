import 'package:flutter/material.dart';
import 'package:paas/utils/utils.dart';

class BBusinessBar with ChangeNotifier {
  int _indexMenu = 0;

  NAVIGATOR_BUSINESS_MAIN _page = NAVIGATOR_BUSINESS_MAIN.PAGE_MAIN_LIST_BUSINESS;


  get indexPage {
    return _page;
  }

  set indexPage(NAVIGATOR_BUSINESS_MAIN page) {
    this._page = page;
    notifyListeners();
  }

  get indexMenu {
    return _indexMenu;
  }

  set indexMenu(int i) {
    this._indexMenu = i;
    notifyListeners();
  }
}
