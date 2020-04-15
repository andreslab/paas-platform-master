import 'package:flutter/material.dart';
import 'module_navigator.dart';
import 'package:paas/widgets/action_bar/business/module_action_bar.dart';

class BModulePage extends StatefulWidget {
  @override
  _BModulePageState createState() => _BModulePageState();
}

class _BModulePageState extends State<BModulePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ModuleActionBarWidget(
          menu: 0,
        ),
        Expanded(
          child: Container(
            child: BModuleNavigatorWidget(),
          ),
        ),
      ],
    );
  }
}
