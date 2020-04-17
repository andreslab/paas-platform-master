import 'package:flutter/material.dart';
import 'package:paas/model/module.dart';
import 'package:paas/modules/register/register.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/providers/modules/module_bar.dart';
import '../utils/utils.dart';
import 'package:provider/provider.dart';


class EditModuleWidget extends StatefulWidget {

  SECTION section;
  EditModuleWidget(this.section);

  @override
  _EditModuleWidgetState createState() => _EditModuleWidgetState();
}

class _EditModuleWidgetState extends State<EditModuleWidget> {
  @override
  Widget build(BuildContext context) {

    var moduleInfo;

    if(widget.section == SECTION.BUSINESS){
        moduleInfo = Provider.of<BModuleBar>(context);
        
    }else{
        moduleInfo = Provider.of<MModuleBar>(context);
      
    }

    ModuleModel module = moduleInfo.moduleSelected;
   

    return RegisterModule();
  }
}