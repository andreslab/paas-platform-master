import 'package:flutter/material.dart';
import '../widgets/module_main.dart';
import '../widgets/utils/module_action_bar.dart';

class ModulePage extends StatefulWidget {
  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ModuleActionBarWidget(
          menu: 0,
        ),
        Expanded(
          child: Container(
            child: ModuleMainWidget(),
          ),
        ),
      ],
    );
  }
}
