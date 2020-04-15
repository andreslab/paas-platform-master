import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/model/module.dart';

class MModuleBar with ChangeNotifier {
  int _indexPage = 0;
  int _indexMenu = 0;

  BusinessModel _businessSelected = BusinessModel(0,"",0,0,0,"");
  ModuleModel _moduleSelected = ModuleModel(0,"","","","");

  get indexPage {
    return _indexPage;
  }

  set indexPage(int i) {
    this._indexPage = i;
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