import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/model/module.dart';
import 'package:paas/utils/utils.dart';

class MModuleBar with ChangeNotifier {
  int _indexMenu = 0;

  NAVIGATOR_MODULE_MAIN _page = NAVIGATOR_MODULE_MAIN.PAGE_MAIN_LIST_MODULES;

  BusinessModel _businessSelected = BusinessModel(0,"",0,0,0,"");
  ModuleModel _moduleSelected = ModuleModel(0,"","","","");

  List<int> _selectedModuleFileToUpload = [];
  NewModule _dataModuleUpload = NewModule();

  get indexPage {
    return _page;
  }

  set indexPage(NAVIGATOR_MODULE_MAIN page) {
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

  get selectedModuleFileToUpload {
    return _selectedModuleFileToUpload;
  }

  set selectedModuleFileToUpload(List<int> selectedFile) {
    this._selectedModuleFileToUpload = selectedFile;
    notifyListeners();
  }

  get dataModuleUpload {
    return _dataModuleUpload;
  }

  set dataModuleUpload(NewModule newModule) {
    this._dataModuleUpload = newModule;
    notifyListeners();
  }
}