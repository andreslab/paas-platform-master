import 'package:flutter/material.dart';
import 'module_navigator.dart';
import 'package:paas/widgets/action_bar/modules/module_action_bar.dart';

class MModulePage extends StatefulWidget {
  @override
  _MModulePageState createState() => _MModulePageState();
}

class _MModulePageState extends State<MModulePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ModuleActionBarWidget(
          menu: 0,
        ),
        Expanded(
          child: Container(
            child: MModuleNavigatorWidget(),
          ),
        ),
      ],
    );
  }
}
