import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/providers/modules/module_bar.dart';
import 'package:paas/widgets/edit_module.dart';
import 'package:paas/widgets/list_modules_general.dart';
import 'package:provider/provider.dart';
import 'package:paas/api/business.dart';
import 'package:paas/utils/utils.dart';

class MModuleNavigatorWidget extends StatefulWidget {
  @override
  _MModuleNavigatorWidgetState createState() => _MModuleNavigatorWidgetState();
}

class _MModuleNavigatorWidgetState extends State<MModuleNavigatorWidget> {
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

    final moduleInfo = Provider.of<MModuleBar>(context);
  

    List<Widget> pages = [
      ModuleListGeneralWidget(Section.MODULES),
      ModuleEditWidget(Section.MODULES)
    ];

    return Container(color: Colors.white, child: pages[moduleInfo.indexPage]);
  }
}
