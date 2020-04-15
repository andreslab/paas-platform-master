import 'package:flutter/material.dart';
import 'package:paas/model/module.dart';
import 'package:paas/modules/register/register.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/providers/modules/module_bar.dart';
import '../utils/utils.dart';
import 'package:provider/provider.dart';


class ModuleEditWidget extends StatefulWidget {

  Section section;
  ModuleEditWidget(this.section);

  @override
  _ModuleEditWidgetState createState() => _ModuleEditWidgetState();
}

class _ModuleEditWidgetState extends State<ModuleEditWidget> {
  @override
  Widget build(BuildContext context) {

    var moduleInfo;

    if(widget.section == Section.BUSINESS){
        moduleInfo = Provider.of<BModuleBar>(context);
        
    }else{
        moduleInfo = Provider.of<MModuleBar>(context);
      
    }

    ModuleModel module = moduleInfo.moduleSelected;
   

    return RegisterModule();
  }
}