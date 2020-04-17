import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/model/module.dart';
import 'package:paas/utils/utils.dart';

class BModuleBar with ChangeNotifier {
  int _indexMenu = 0;

  NAVIGATOR_BUSINESS_MODULE _page = NAVIGATOR_BUSINESS_MODULE.PAGE_MAIN_LIST_BUSINESS;

  BusinessModel _businessSelected = BusinessModel(0,"",0,0,0,"");
  ModuleModel _moduleSelected = ModuleModel(0,"","","","");

  get indexPage {
    return _page;
  }

  set indexPage(NAVIGATOR_BUSINESS_MODULE page) {
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

  get businessSelected {
    return _businessSelected;
  }

  set businessSelected(BusinessModel businessModel) {
    this._businessSelected = businessModel;
    notifyListeners();
  }

  get moduleSelected {
    return _moduleSelected;
  }

  set moduleSelected(ModuleModel moduleModel) {
    this._moduleSelected = moduleModel;
    notifyListeners();
  }
}