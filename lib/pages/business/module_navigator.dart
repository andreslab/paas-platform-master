import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/model/module.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/widgets/list_business.dart';
import 'package:paas/widgets/edit_module.dart';
import 'package:paas/widgets/list_modules_by_business.dart';
import 'package:paas/widgets/list_modules_general.dart';
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

    
    _loadBusiness();

    final moduleInfo = Provider.of<BModuleBar>(context);
  

    List<Widget> pages = [
      ModuleBusinessListWidget(dataBusiness, Section.BUSINESS),
      ModuleListByBusinessWidget(Section.BUSINESS),
      ModuleListGeneralWidget(Section.BUSINESS),
      ModuleEditWidget(Section.BUSINESS)
    ];

    return Container(color: Colors.white, child: pages[moduleInfo.indexPage]);
  }
}
