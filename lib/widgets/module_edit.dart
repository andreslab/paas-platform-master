import 'package:flutter/material.dart';
import 'package:paas/model/module.dart';
import 'package:paas/modules/register/register.dart';

class ModuleEditWidget extends StatefulWidget {

  ModuleModel module;

  ModuleEditWidget(this.module);

  @override
  _ModuleEditWidgetState createState() => _ModuleEditWidgetState();
}

class _ModuleEditWidgetState extends State<ModuleEditWidget> {
  @override
  Widget build(BuildContext context) {
    return RegisterModule();
  }
}