import 'package:flutter/material.dart';
import 'package:paas/api/module.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/utils/utils.dart';

mixin EventModuleBar {
  addModule(BuildContext context, BModuleBar provider, moduleId, businessId) async {
    final _moduleAPI = ModuleAPI();

    //call request
    final res = await _moduleAPI.setModuleByBusiness(context, moduleId, businessId);
    if (res == true) {
      print("SAVE SUCCESS");
      provider.indexPage = NAVIGATOR_BUSINESS_MODULE.PAGE_MAIN_LIST_BUSINESS;
      provider.indexMenu = 0;
    } else {
      print("SAVE ERROR");
    }
  }

  void goModuleMain(BModuleBar provider) {
    provider.indexPage = NAVIGATOR_BUSINESS_MODULE.PAGE_MAIN_LIST_BUSINESS;
    provider.indexMenu = 0;
  }

  void goModuleBusinessList(BModuleBar provider,){
    provider.indexPage = NAVIGATOR_BUSINESS_MODULE.PAGE_LIST_BUSINESS_MODULES;
    provider.indexMenu = 1;
  }

  void goModuleList(BModuleBar provider,){
    provider.indexPage = NAVIGATOR_BUSINESS_MODULE.PAGE_LIST_MODULES;
    provider.indexMenu = 2;
  }

  void goModuleEdit(BModuleBar provider,){
    provider.indexPage = NAVIGATOR_BUSINESS_MODULE.PAGE_EDIT_MODULE;
    provider.indexMenu = 3;
  }

  void showFilterView(){
    print("show filter");
  }

}
