import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/model/module.dart';
import 'package:paas/providers/module_bar.dart';
import 'package:paas/widgets/module_business_list.dart';
import 'package:paas/widgets/module_edit.dart';
import 'package:paas/widgets/module_list_by_business.dart';
import 'package:paas/widgets/module_list_general.dart';
import 'package:provider/provider.dart';
import '../api/business.dart';

class ModuleMainWidget extends StatefulWidget {
  @override
  _ModuleMainWidgetState createState() => _ModuleMainWidgetState();
}

class _ModuleMainWidgetState extends State<ModuleMainWidget> {
  final _businessAPI = BusinessAPI();
  //var businessCount = 0;
  List<BusinessModel> dataBusiness = List<BusinessModel>();
  BusinessModel dataModuleByBusiness = BusinessModel(1, "Andreslab", 1,1,1, "");
  List<ModuleModel> dataModule = List<ModuleModel>();
  ModuleModel module = ModuleModel(1, "","","","");

  _loadBusiness() async {
    //call request
    final res = await _businessAPI.getBusinessList(context);

    if (res != null) {
      print("OK");
      setState(() {
        //businessCount = res.length;
        dataBusiness = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadBusiness();

    final moduleInfo = Provider.of<ModuleBar>(context);

    List<Widget> pages = [
      ModuleBusinessListWidget(dataBusiness),
      ModuleListByBusinessWidget(dataModuleByBusiness),
      ModuleListGeneralWidget(dataModule),
      ModuleEditWidget(module)
    ];

    return Container(color: Colors.white, child: pages[moduleInfo.indexPage]);
  }
}
