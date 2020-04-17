import 'package:flutter/material.dart';
import 'package:paas/api/module.dart';
import 'package:paas/providers/modules/module_bar.dart';
import 'package:paas/utils/utils.dart';

mixin EventModuleBar {
  addModule(BuildContext context, MModuleBar provider, moduleId, businessId) async {
    final _moduleAPI = ModuleAPI();

    //call request
    final res = await _moduleAPI.setModuleByBusiness(context, moduleId, businessId);
    if (res == true) {
      print("SAVE SUCCESS");
      provider.indexPage = NAVIGATOR_MODULE_MAIN.PAGE_MAIN_LIST_MODULES;
      provider.indexMenu = 0;
    } else {
      print("SAVE ERROR");
    }
  }

  void goModuleMain(MModuleBar provider) {
    provider.indexPage = NAVIGATOR_MODULE_MAIN.PAGE_MAIN_LIST_MODULES;
    provider.indexMenu = 0;
  }

  void goModuleUpload(MModuleBar provider,){
    provider.indexPage = NAVIGATOR_MODULE_MAIN.PAGE_NEW_MODULE;
    provider.indexMenu = 1;
  }

  void showFilterView(){
    print("show filter");
  }

}
