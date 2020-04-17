import 'package:paas/providers/business/business_bar.dart';
import 'package:paas/utils/utils.dart';

mixin EventBusinessBar {
  /*addModule(BuildContext context, BBusinessBar provider, moduleId, businessId) async {
    final _moduleAPI = ModuleAPI();

    //call request
    final res = await _moduleAPI.setModuleByBusiness(context, moduleId, businessId);
    if (res == true) {
      print("SAVE SUCCESS");
      provider.indexPage = NAVIGATOR_BUSINESS_MAIN.PAGE_MAIN;
      provider.indexMenu = 0;
    } else {
      print("SAVE ERROR");
    }
  }*/

  void goBusinessMain(BBusinessBar provider) {
    provider.indexPage = NAVIGATOR_BUSINESS_MAIN.PAGE_MAIN_LIST_BUSINESS;
    provider.indexMenu = 0;
  }

  void goBusinessDetail(BBusinessBar provider){
    provider.indexPage = NAVIGATOR_BUSINESS_MAIN.PAGE_DETAIL_BUSINESS;
    provider.indexMenu = 1;
  }


  void showFilterView(){
    print("show filter");
  }

}
