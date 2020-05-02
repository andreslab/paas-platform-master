import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/providers/modules/module_bar.dart';
import 'package:paas/widgets/edit_module.dart';
import 'package:paas/widgets/list_modules.dart';
import 'package:provider/provider.dart';
import 'package:paas/api/business.dart';
import 'package:paas/utils/utils.dart';
import 'package:paas/widgets/upload_module.dart';

class MModuleNavigatorWidget extends StatefulWidget {
  @override
  _MModuleNavigatorWidgetState createState() => _MModuleNavigatorWidgetState();
}

class _MModuleNavigatorWidgetState extends State<MModuleNavigatorWidget> {
  
  @override
  Widget build(BuildContext context) {


    final moduleInfo = Provider.of<MModuleBar>(context);

    switch (moduleInfo.indexPage) {
      case NAVIGATOR_MODULE_MAIN.PAGE_MAIN_LIST_MODULES:
        return ListModulesWidget(SECTION.MODULES);
      case NAVIGATOR_MODULE_MAIN.PAGE_EDIT_MODULE:
        return EditModuleWidget(SECTION.MODULES);
      case NAVIGATOR_MODULE_MAIN.PAGE_NEW_MODULE:
        return UploadModuleWidget();
    }
  }
}
