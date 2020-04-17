import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/model/module.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/widgets/list_business.dart';
import 'package:paas/widgets/edit_module.dart';
import 'package:paas/widgets/list_modules_by_business.dart';
import 'package:paas/widgets/list_modules.dart';
import 'package:provider/provider.dart';
import 'package:paas/api/business.dart';
import 'package:paas/utils/utils.dart';

class BModuleNavigatorWidget extends StatefulWidget {
  @override
  _BModuleNavigatorWidgetState createState() => _BModuleNavigatorWidgetState();
}

class _BModuleNavigatorWidgetState extends State<BModuleNavigatorWidget> {
  final _businessAPI = BusinessAPI();

  List<BusinessModel> dataBusiness = List<BusinessModel>();

  _loadBusiness() async {
    //call request
    final res = await _businessAPI.getBusinessList(context);

    if (res != null) {
      print("OK");
      setState(() {
        dataBusiness = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    
    if (dataBusiness.length == 0){
      _loadBusiness();
    }

    final moduleInfo = Provider.of<BModuleBar>(context);
  


    switch (moduleInfo.indexPage) {
      case NAVIGATOR_BUSINESS_MODULE.PAGE_MAIN_LIST_BUSINESS:
        return ListBusinessWidget(dataBusiness, SECTION.BUSINESS);
      case NAVIGATOR_BUSINESS_MODULE.PAGE_LIST_BUSINESS_MODULES:
        return ListModulesByBusinessWidget(SECTION.BUSINESS);
      case NAVIGATOR_BUSINESS_MODULE.PAGE_LIST_MODULES:
        return ListModulesWidget(SECTION.BUSINESS);
      case NAVIGATOR_BUSINESS_MODULE.PAGE_EDIT_MODULE:
        return EditModuleWidget(SECTION.BUSINESS);
    }
  }
}
